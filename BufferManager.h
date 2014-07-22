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

const UInt32 kNumDrawBuffers = 2;

class BufferManager
{
    public:
        BufferManager( UInt32 _framesSize );
        ~BufferManager();
    
        Float32**       GetWaveBuffers ()  { return _WaveBuffers; }
        void            CopyAudioDataToWaveBuffer( Float32* inData, UInt32 NewNumFrames );
        void            CycleWaveBuffers();
        void            SetWaveBufferLength ( UInt32 NewWaveBufferLen ) { _WaveBufferLen = NewWaveBufferLen; }
        UInt32          GetWaveBufferLength ()   { return _WaveBufferLen; }
    
    
        Float32**       GetFFTBuffers ()  { return _FFTBuffers; }
        Float32*        GetFFTInputBuffers ()  { return _FFTInputBuffer; }
        void            CopyAudioDataToFFTInputBuffer( Float32* inData, UInt32 NewNumFrames );
        void            CopyAudioDataToFFTInputBufferVer2( Float32* inData, UInt32 NewNumFrames );
        void            CycleFFTBuffers();
        void            SetFFTBufferLength ( UInt32 NewFFTBufferLen ) { _FFTBufferLen = NewFFTBufferLen; }
        UInt32          GetFFTBufferLength ()   { return _FFTBufferLen; }
    
        UInt32          GetFFTOutputBufferLength() { return _FFTInputBufferLen / 2; }
        void            GetFFTOutput ( Float32* outFFTData );
        void            GetCepstrumOutput ( Float32* inFFTData, Float32* outCepstrumData );
        void            GetFFTCepstrumOutput ( Float32* inFFTData, Float32* inCepstrumData, Float32* inFFTCepstrumData );

        bool            HasNewFFTData()     { return static_cast<bool>(_HasNewFFTData); };
        bool            NeedsNewFFTData()   { return static_cast<bool>(_NeedsNewFFTData); };
    
    private:
        Float32*                    _WaveBuffers[kNumDrawBuffers];
        UInt32                      _WaveBufferIndex;
        UInt32                      _WaveBufferLen;

        Float32*                    _FFTBuffers[kNumDrawBuffers];
        UInt32                      _FFTBufferIndex;
        UInt32                      _FFTBufferLen;
    
        Float32*                    _FFTInputBuffer;
        Float32*                    _FFTInputBuffer_Backup;
        bool                        _IsBackupEmpty;
        UInt32                      _FFTInputBufferFrameIndex;
        UInt32                      _FFTInputBufferLen;
        volatile int32_t            _HasNewFFTData;
        volatile int32_t            _NeedsNewFFTData;
        
        WaveFFTCepstrumHelper*      _WaveFFTCepstrumHelper;
};

#endif /* defined(__aurioTouch3__BufferManager__) */
