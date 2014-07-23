//
//  BufferManager.cpp
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#include "BufferManager.h"

#define min(x,y) (x < y) ? x : y

BufferManager::BufferManager( UInt32  NewFramesSize, UInt32  NewSamplingRate, Float32 NewOverlap )
{
    _FrameSize = NewFramesSize;
    _SamplingRate = NewSamplingRate;
    _BufferLen = _SamplingRate * 5;         // Store 5 seconds audio data
    _CurDataIdx = 0;
    _FFTStartIdx = 0;
    _FFTEndIdx = NewFramesSize-1;
    _Overlap = NewOverlap;
    _AudioDataBuffer = (Float32*) calloc(_BufferLen, sizeof(Float32));
    _WaveFFTCepstrumHelper = new WaveFFTCepstrumHelper(_FrameSize);
    
    _HasNewFFTData = 0;
    _NeedsNewFFTData = 0;
    OSAtomicIncrement32Barrier(&_NeedsNewFFTData);
}
BufferManager::~BufferManager()
{
    free(_AudioDataBuffer);
    _AudioDataBuffer = NULL;
    
    delete _WaveFFTCepstrumHelper;
    _WaveFFTCepstrumHelper = NULL;
}

void BufferManager::CopyAudioDataToBuffer( Float32* inData, UInt32 NewNumSamples )
{
    if (inData == NULL) return;
    
    for (UInt32 i=0; i<NewNumSamples; i++)
    {
        if (i + _CurDataIdx >= _BufferLen)
            _CurDataIdx = -i;
        
        _AudioDataBuffer[i + _CurDataIdx] = inData[i];
    }
    _CurDataIdx += NewNumSamples;
    
    // The following segment of codes assume that GetFFTOuput() is being continuously called!
    if (_FFTStartIdx < _FFTEndIdx)
    {
        if (_FFTEndIdx < _CurDataIdx && NeedsNewFFTData())
        {
            //printf("_CurDataIdx: %ld\n", _CurDataIdx);
            
            OSAtomicIncrement32(&_HasNewFFTData);
            OSAtomicDecrement32(&_NeedsNewFFTData);
        }
    }
    else if (_FFTEndIdx < _FFTStartIdx)
    {
        if (_FFTEndIdx < _CurDataIdx && _CurDataIdx < _FFTStartIdx && NeedsNewFFTData())
        {
            //printf("_CurDataIdx: %ld\n", _CurDataIdx);
            
            OSAtomicIncrement32(&_HasNewFFTData);
            OSAtomicDecrement32(&_NeedsNewFFTData);
        }
    }
    else
        printf("BufferManager::CopyAudioDataToBuffer() - this code should never execute!");
}

Float32* BufferManager::GetFFTBuffers()
{
    Float32* _FFTBuffer = (Float32*) calloc(_FrameSize, sizeof(Float32));
    
    if (_FFTStartIdx < _FFTEndIdx)
    {
        if (_FFTEndIdx < _CurDataIdx && HasNewFFTData())
        {
            for (UInt32 i=0; i<_FrameSize; i++)
                _FFTBuffer[i] = _AudioDataBuffer[_FFTStartIdx+i];
        }
    }
    else if (_FFTEndIdx < _FFTStartIdx)
    {
        if (_FFTEndIdx < _CurDataIdx && _CurDataIdx < _FFTStartIdx && HasNewFFTData())
        {
            UInt32 i, k=0;
            for (i=_FFTStartIdx; i<_BufferLen; i++, k++)
                _FFTBuffer[k] = _AudioDataBuffer[i];
            for (i=0; i<=_FFTEndIdx; i++, k++)
                _FFTBuffer[k] = _AudioDataBuffer[i];
        }
    }
    else
        printf("BufferManager::GetFFTBuffers() - this code should never execute!");
    
    return _FFTBuffer;
}

void BufferManager::GetFFTOutput( Float32* outFFTData )
{
    if (HasNewFFTData())
    {
        Float32* _FFTBuffer = GetFFTBuffers();
        _WaveFFTCepstrumHelper->ComputeABSFFT(_FFTBuffer, outFFTData);
        
        ManageFFTBuffer();
        
        free(_FFTBuffer);
        
        OSAtomicDecrement32Barrier(&_HasNewFFTData);
        OSAtomicIncrement32Barrier(&_NeedsNewFFTData);
    }
}

void BufferManager::ManageFFTBuffer()
{
    UInt32 increment = floor((double)((Float32)_FrameSize*(Float32)(1-_Overlap)));
    UInt32 tmpFFTStartIdx = _FFTStartIdx + increment;
    UInt32 tmpFFTEndIdx = _FFTEndIdx + increment;
    if ( tmpFFTStartIdx >= _BufferLen)
        _FFTStartIdx = tmpFFTStartIdx - _BufferLen;
    else
        _FFTStartIdx = tmpFFTStartIdx;
    if ( tmpFFTEndIdx >= _BufferLen)
        _FFTEndIdx = tmpFFTEndIdx - _BufferLen;
    else
        _FFTEndIdx = tmpFFTEndIdx;
}

void BufferManager::GetCepstrumOutput ( Float32* inFFTData, Float32* outCepstrumData )
{
    _WaveFFTCepstrumHelper->ComputeCepstrum(inFFTData, outCepstrumData);
}

void BufferManager::GetFFTCepstrumOutput ( Float32* inFFTData, Float32* inCepstrumData, Float32* inFFTCepstrumData )
{
    _WaveFFTCepstrumHelper->ComputeFFTCepstrum(inFFTData, inCepstrumData, inFFTCepstrumData);
}