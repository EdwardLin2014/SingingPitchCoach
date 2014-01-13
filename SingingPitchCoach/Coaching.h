//
//  Coaching.h
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//
@import AVFoundation;
#import <SpriteKit/SpriteKit.h>
#import "Note.h"

// Pitch's y position
#define C5_y        294.5
#define B4_y        282.5
#define ASharp4_y   270.5
#define A4_y        258.5
#define GSharp4_y   246.5
#define G4_y        234.5
#define FSharp4_y   222.5
#define F4_y        210.5
#define E4_y        198.5
#define DSharp4_y   186.5
#define D4_y        174.5
#define CSharp4_y   162.5
#define C4_y        150.5
#define B3_y        138.5
#define ASharp3_y   126.5
#define A3_y        114.5
#define GSharp3_y   102.5
#define G3_y        90.5
#define FSharp3_y   78.5
#define F3_y        67.5
#define E3_y        54.5
#define DSharp3_y   42.5
#define D3_y        30.5
#define CSharp3_y   18.5
#define C3_y        6

// Score's x-axis Position
#define x1          100
#define x2          131
#define x3          162
#define x4          193
#define x5          223
#define x6          254
#define x7          284
#define x8          315
#define x9          345
#define x10         375
#define x11         405.5
#define x12         436.5
#define x13         467
#define x14         498
#define x15         528.5

@class PitchDetector;

@interface Coaching : SKScene
{
    PitchDetector *pitchDetector;
    SKSpriteNode *pianoRoll;
    SKSpriteNode *indicator;
    
    NSUserDefaults *userDefaults;

    float animationSpeed;
    float tempoRate;
    
    Note *score1[8];
    
    SKLabelNode *readyLabel;
    SKLabelNode *goLabel;
    
    AVPlayer *audioPlayer;
    
    bool gameOver;
    int notePos;
    CFTimeInterval nextNoteTime;
    
    float scorePoint;
    float totalScorePoint;
    float performanceScorePoint;
    
    SKSpriteNode* scoreLine;
}

// Scores
-(void)playNote:(Note *)note isLastNote:(bool)isLastNote;
-(void)playEighthNote:(NSString *)pitch;
-(void)playQuarterNote:(NSString *)pitch;
-(void)playHalfNote:(NSString *)pitch;
-(void)playFullNote:(NSString *)pitch;

// Indicator Movement
-(int)pitchToPosition:(NSString *)pitch;
-(int)midiToPosition:(int)midi;
-(void)moveIndicatorByPitch:(NSString *)pitch;
-(void)moveIndicatorByMIDI:(int)midi;

// Play Sound
-(void)playSound:(NSString *)fileName;

// Game Control
- (void)startTheGame;
- (void)endTheGame;
- (bool)isScorePoint:(NSString *)pitch;

@end