//
//  BufferManager.cpp
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#include "BufferManager.h"

#define min(x,y) (x < y) ? x : y

BufferManager::BufferManager( UInt32 _framesSize ) :
_WaveBuffers(),
_WaveBufferIndex(0),
_WaveBufferLen(_framesSize),
_FFTBuffers(),
_FFTBufferIndex(0),
_FFTBufferLen(_framesSize),
_FFTInputBuffer(NULL),
_FFTInputBufferFrameIndex(0),
_FFTInputBufferLen(_framesSize),
_IsBackupEmpty(true),
_HasNewFFTData(0),
_NeedsNewFFTData(0),
_WaveFFTCepstrumHelper(NULL)
{
    for(UInt32 i=0; i<kNumDrawBuffers; ++i)
    {
        _WaveBuffers[i] = (Float32*) calloc(_framesSize, sizeof(Float32));
        _FFTBuffers[i] = (Float32*) calloc(_framesSize, sizeof(Float32));
    }
    
    _FFTInputBuffer = (Float32*) calloc(_framesSize, sizeof(Float32));
    _FFTInputBuffer_Backup = (Float32*) calloc(_framesSize, sizeof(Float32));
    _WaveFFTCepstrumHelper = new WaveFFTCepstrumHelper(_framesSize);
    OSAtomicIncrement32Barrier(&_NeedsNewFFTData);
}
BufferManager::~BufferManager()
{
    for(UInt32 i=0; i<kNumDrawBuffers; ++i)
    {
        free(_WaveBuffers[i]);
        _WaveBuffers[i] = NULL;
        
        free(_FFTBuffers[i]);
        _FFTBuffers[i] = NULL;
    }
    
    free(_FFTInputBuffer);
    delete _WaveFFTCepstrumHelper;
    _WaveFFTCepstrumHelper = NULL;
}


void BufferManager::CopyAudioDataToWaveBuffer( Float32* inData, UInt32 NewNumFrames )
{
    if (inData == NULL) return;
    
    for (UInt32 i=0; i<NewNumFrames; i++)
    {
        if ((i+_WaveBufferIndex) >= _WaveBufferLen)
        {
            CycleWaveBuffers();
            _WaveBufferIndex = -i;
        }
        _WaveBuffers[0][i + _WaveBufferIndex] = inData[i];
    }
    _WaveBufferIndex += NewNumFrames;
}
void BufferManager::CycleWaveBuffers()
{
    // Cycle the lines in our draw buffer so that they age and fade. The oldest line is discarded.
	for (int i=(kNumDrawBuffers - 2); i>=0; i--)
		memmove(_WaveBuffers[i + 1], _WaveBuffers[i], _WaveBufferLen);
}


void BufferManager::CopyAudioDataToFFTInputBuffer( Float32* inData, UInt32 NewNumFrames )
{
    UInt32 framesToCopy = min(NewNumFrames, _FFTInputBufferLen - _FFTInputBufferFrameIndex);
    
    //memcpy(_FFTInputBuffer + _FFTInputBufferFrameIndex, inData, framesToCopy * sizeof(Float32));
    //_FFTInputBufferFrameIndex += framesToCopy * sizeof(Float32);
    
    memcpy(_FFTInputBuffer + _FFTInputBufferFrameIndex, inData, framesToCopy);
    _FFTInputBufferFrameIndex += framesToCopy;
    
    if (_FFTInputBufferFrameIndex >= _FFTInputBufferLen)
    {
        OSAtomicIncrement32(&_HasNewFFTData);
        OSAtomicDecrement32(&_NeedsNewFFTData);
    }
}
void BufferManager::CopyAudioDataToFFTInputBufferVer2( Float32* inData, UInt32 NewNumFrames )
{
    UInt32 i=0;
    
    // If there is previous remaining data, add them to FFTInputBuffer first
    if (!_IsBackupEmpty)
    {
        for (i=0; i<_FFTInputBufferFrameIndex; i++)
            _FFTInputBuffer[i] = _FFTInputBuffer_Backup[i];
        
        _IsBackupEmpty = true;
    }
    
    UInt32 remainData = _FFTInputBufferLen - _FFTInputBufferFrameIndex;
    UInt32 framesToCopy = min(NewNumFrames, _FFTInputBufferLen - _FFTInputBufferFrameIndex);
    
    for (i=0; i<framesToCopy; i++)
        _FFTInputBuffer[i+_FFTInputBufferFrameIndex] = inData[i];
    _FFTInputBufferFrameIndex += framesToCopy;
    
    if (_FFTInputBufferFrameIndex >= _FFTInputBufferLen)
    {
        OSAtomicIncrement32(&_HasNewFFTData);
        OSAtomicDecrement32(&_NeedsNewFFTData);
    }
    
    // If there is any remaining data, then store them
    if (remainData < NewNumFrames)
    {
        remainData = NewNumFrames - remainData;
        
        for (i=0; i<remainData; i++)
            _FFTInputBuffer_Backup[i] = inData[framesToCopy+i];
        
        _FFTInputBufferFrameIndex = remainData;
        _IsBackupEmpty = false;
    }
}
void BufferManager::CycleFFTBuffers()
{
    // Cycle the lines in our draw buffer so that they age and fade. The oldest line is discarded.
	for (int i=(kNumDrawBuffers - 2); i>=0; i--)
		memmove(_FFTBuffers[i + 1], _FFTBuffers[i], _FFTBufferLen);
}
void BufferManager::GetFFTOutput( Float32* outFFTData )
{
    _WaveFFTCepstrumHelper->ComputeABSFFT(_FFTInputBuffer, outFFTData);
    _FFTInputBufferFrameIndex = 0;
    
    OSAtomicDecrement32Barrier(&_HasNewFFTData);
    OSAtomicIncrement32Barrier(&_NeedsNewFFTData);
}
void BufferManager::GetCepstrumOutput ( Float32* inFFTData, Float32* outCepstrumData )
{
    _WaveFFTCepstrumHelper->ComputeCepstrum(inFFTData, outCepstrumData);
}
void BufferManager::GetFFTCepstrumOutput ( Float32* inFFTData, Float32* inCepstrumData, Float32* inFFTCepstrumData )
{
    _WaveFFTCepstrumHelper->ComputeFFTCepstrum(inFFTData, inCepstrumData, inFFTCepstrumData);
}