//
//  WaveFFTCepstrumHelper.cpp
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#include "WaveFFTCepstrumHelper.h"

// Utility includes
#include "CABitOperations.h"

const Float32 kAdjust0DB = 1.5849e-13;

WaveFFTCepstrumHelper::WaveFFTCepstrumHelper ( UInt32 _framesSize ) :
_SpectrumAnalysis(NULL),
_FFTNormFactor(0.5),
_FFTLength(_framesSize/2),
_Log2N(Log2Ceil(_framesSize)),
_FrameSize(_framesSize)
{
    _DspSplitComplex.realp = (Float32*) calloc(_FFTLength, sizeof(Float32));
    _DspSplitComplex.imagp = (Float32*) calloc(_FFTLength, sizeof(Float32));
    _SpectrumAnalysis = vDSP_create_fftsetup(_Log2N, kFFTRadix2);
    
    _DspVector = (Float32*) calloc(_framesSize, sizeof(Float32));
    _logFFT = (Float32*) calloc(_framesSize, sizeof(Float32));
    _logCep = (Float32*) calloc(_framesSize, sizeof(Float32));
}
WaveFFTCepstrumHelper::~WaveFFTCepstrumHelper()
{
    vDSP_destroy_fftsetup(_SpectrumAnalysis);
    free (_DspSplitComplex.realp);
    free (_DspSplitComplex.imagp);
    
    free (_DspVector);
    free (_logFFT);
    free (_logCep);
}

/*
 *  Implement Matlab's abs(fft(inData))
 *  Size of inDate and outFFTData: __FrameSize
 */
void WaveFFTCepstrumHelper::ComputeABSFFT(Float32* inData, Float32* outFFTData)
{
	if (inData == NULL || outFFTData == NULL) return;
    
    //    for (UInt32 i=0; i<_FrameSize; i++)
    //        printf("inData[%ld]: %.12f\n", i, inData[i]);
    
    //Generate a split complex vector from the real data
    vDSP_ctoz((COMPLEX *)inData, 2, &_DspSplitComplex, 1, _FFTLength);
    
    //Take the fft and scale appropriately
    vDSP_fft_zrip(_SpectrumAnalysis, &_DspSplitComplex, 1, _Log2N, kFFTDirection_Forward);
    
    // Scale the fft result by 0.5
    if (_DspSplitComplex.realp + _FFTLength != NULL)
        _midReal = _DspSplitComplex.realp[_FFTLength];
    else
        _midReal = 0;
    if (_DspSplitComplex.imagp + _FFTLength != NULL)
        _midImag = _DspSplitComplex.imagp[_FFTLength];
    else
        _midImag = 0;
    _midReal *= _FFTNormFactor;
    _midImag *= _FFTNormFactor;
    for (UInt32 i=0; i<_FFTLength; i++)
    {
        _DspSplitComplex.realp[i] *= _FFTNormFactor;
        _DspSplitComplex.imagp[i] *= _FFTNormFactor;
    }
    
    //Zero out the nyquist value
    _DspSplitComplex.imagp[0] = 0.0;
    
    //Convert the fft result: abs(fft)
    vDSP_zvabs(&_DspSplitComplex, 1, outFFTData, 1, _FFTLength);
    
    //Mirror the first half result
    for (UInt32 i=0; i<_FFTLength-1; i++)
        outFFTData[_FrameSize-1-i] = outFFTData[i+1];
    outFFTData[_FFTLength] = sqrtf((_midReal*_midReal) + (_midImag*_midImag));
    // FIXME: Should we do this?----
    if (outFFTData[_FFTLength]==0)
        outFFTData[_FFTLength] = kAdjust0DB;
    //------------------------------
    
    //    for (UInt32 i=0; i<_FrameSize; i++)
    //        printf("outFFTData[%ld]: %.12f\n", i, outFFTData[i]);
    
    // Clear the temporary storage
    memset(_DspSplitComplex.realp, 0, _FFTLength*sizeof(Float32));
    memset(_DspSplitComplex.imagp, 0, _FFTLength*sizeof(Float32));
}

/*
 *  Implement Matlab's abs(fft(log(inFFTData)))
 *  Size of inFFTData and outCepstrumData: __FrameSize
 */
void WaveFFTCepstrumHelper::ComputeCepstrum ( Float32* inFFTData, Float32* outCepstrumData )
{
	if (inFFTData == NULL || outCepstrumData == NULL) return;
    
    // Take the log of the FFT result
    for (UInt32 i=0; i<_FrameSize; i++)
        _DspVector[i] = logf(inFFTData[i]);
    
    // Do the FFT again
    ComputeABSFFT(_DspVector, outCepstrumData);
    
    // Clear the temporary storage
    memset(_DspVector, 0, _FrameSize*sizeof(Float32));
}
void WaveFFTCepstrumHelper::ComputeFFTCepstrum ( Float32* inFFTData, Float32* inCepstrumData, Float32* inFFTCepstrumData )
{
    // Suggest by Simon's PhD Thesis - Take a log of FFT and Cepstrum to sharpen its peak
    for (UInt32 i=0; i<_FrameSize; i++)
    {
        _logFFT[i] = logf(inFFTData[i]);
        _logCep[i] = logf(inCepstrumData[i]);
    }
    
    for (UInt32 i=0; i<_FrameSize; i++)
    {
        inFFTCepstrumData[i] = inFFTData[i]*_logCep[i];
        //inFFTCepstrumData[i] = _logFFT[i]*_logCep[i];
        //inFFTCepstrumData[i] = inFFTData[i]*inCepstrumData[i];
    }
    
    // Clear the temporary storage
    memset(_logFFT, 0, _FrameSize*sizeof(Float32));
    memset(_logCep, 0, _FrameSize*sizeof(Float32));
}