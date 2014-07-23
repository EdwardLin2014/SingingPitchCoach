//
//  AudioController.h
//  SingingPitchCoach
//
//  Created by Edward on 22/7/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#import "BufferManager.h"
#import "DCRejectionFilter.h"

// Utility file includes
#import "CAXException.h"
#import "CAStreamBasicDescription.h"

@interface AudioController : NSObject
{
    AudioUnit                   _rioUnit;
    BufferManager*              _bufferManager;
    DCRejectionFilter*          _dcRejectionFilter;
    BOOL                        _audioChainIsBeingReconstructed;    //FIXME: semaphore?
    
    UInt32                      _sampleRate;
    UInt32                      _framesSize;
    Float32                     _Overlap;
    
    Float32                     _frequency;
    Float32                     _midiNum;
    NSString*                   _pitch;
    
    NSTimer*                    _pitchEstimatedScheduler;
    
    UInt32                      _Hz120;      // G2
    UInt32                      _Hz530;      // C5
    UInt32                      _Hz1100;     // C6
    
    NSString*                   _FileNameWave;
    NSString*                   _FileNameFFT;
    AudioFileID                 _WaveFile;
    AudioFileID                 _FFTFile;
    BOOL                        _isRecording;   //FIXME: semaphore?
    CAStreamBasicDescription    _ioFormat;
}

/* -----------------------------Public Methods--------------------------------- Begin */
- (id)init:(UInt32)NewSampleRate FrameSize:(UInt32)NewFrameSize OverLap:(Float32)NewOverlap;
- (OSStatus)startIOUnit;
- (OSStatus)stopIOUnit;
- (void)EstimatePitch;
- (Float32)CurrentFreq;
- (Float32)CurrentMIDI;
- (NSString*)CurrentPitch;
/* -----------------------------Public Methods--------------------------------- End */

/* -----------------------------Private Methods--------------------------------- Begin */
- (void)setupAudioChain;
- (void)setupAudioSession;
- (void)setupIOUnit;

- (void)handleInterruption:(NSNotification *)notification;
- (void)handleRouteChange:(NSNotification *)notification;
- (void)handleMediaServerReset:(NSNotification *)notification;

- (Float32)freqToMIDI:(Float32)frequency;
- (NSString*)midiToPitch:(Float32)midiNote;

// Obsolete Functions or Functions which need improvement
- (BufferManager*)getBufferManagerInstance;
- (UInt32)getFrameSize;
- (double)sessionSampleRate;
- (BOOL)audioChainIsBeingReconstructed;

- (void)startRecording;
- (void)stopRecording;
- (BOOL)isRecording;
- (void)GetFFTOutput:(Float32*)outFFTData;
/* -----------------------------Private Methods--------------------------------- Begin */

@end
