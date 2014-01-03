//
//  Coaching.h
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class PitchDetector;

@interface Coaching : SKScene
{
    PitchDetector *pitchDetector;
    SKSpriteNode *indicator;
}

-(int)pitchToPosition:(NSString *)pitch;
-(int)midiToPosition:(int)midi;
-(void)moveIndicatorByPitch:(NSString *)pitch;
-(void)moveIndicatorByMIDI:(int)midi;

@end