//
//  BufferManager.h
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#ifndef __BufferManager__
#define __BufferManager__

#include <AudioToolbox/AudioToolbox.h>
#include <libkern/OSAtomic.h>

#include "WaveFFTCepstrumHelper.h"

class BufferManager
{
public:
    BufferManager( UInt32  NewFramesSize, UInt32  NewSamplingRate, Float32 NewOverlap );
    ~BufferManager();
    
    Float32*        GetAudioDataBuffers ()  { return _AudioDataBuffer; }
    void            CopyAudioDataToBuffer( Float32* inData, UInt32 NewNumSamples );
    Float32*        GetFFTBuffers ();
    void            GetFFTOutput ( Float32* outFFTData );
    void            ManageFFTBuffer();
    void            GetCepstrumOutput ( Float32* inFFTData, Float32* outCepstrumData );
    void            GetFFTCepstrumOutput ( Float32* inFFTData, Float32* inCepstrumData, Float32* inFFTCepstrumData );
    
    bool            HasNewFFTData()     { return static_cast<bool>(_HasNewFFTData); };
    bool            NeedsNewFFTData()   { return static_cast<bool>(_NeedsNewFFTData); };
    
private:
    UInt32                      _FrameSize;
    UInt32                      _SamplingRate;
    UInt32                      _BufferLen;
    
    UInt32                      _CurDataIdx;
    UInt32                      _FFTStartIdx;
    UInt32                      _FFTEndIdx;
    Float32                     _Overlap;
    Float32*                    _AudioDataBuffer;
    
    volatile int32_t            _HasNewFFTData;
    volatile int32_t            _NeedsNewFFTData;
    WaveFFTCepstrumHelper*      _WaveFFTCepstrumHelper;
};

#endif /* defined(__BufferManager__) */
