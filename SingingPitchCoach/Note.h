//
//  Note.h
//  SingingPitchCoach
//
//  Created by Edward on 7/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Note : NSObject
{
    NSString* pitch;
    CFTimeInterval duration;
    Boolean playDemo;
    float tempoRate;
    Boolean isPlayed;
    SKSpriteNode* UI;
    
}

- (id)initWithPitch:(NSString*)setPitch
       AndTempoRate:(float)setTempoRate
       AndDuration:(NSString *)setDuration
       AndPlayDemo:(Boolean)setPlayDemo;

- (void)setUI:(SKSpriteNode*)setUI;

- (NSString*)getPitch;
- (CFTimeInterval)getDurationInTime;
- (NSString*)getDurationInString;
- (Boolean)getPlayDemo;
- (SKSpriteNode*)getUI;
- (Boolean)isPlayed;

- (void)play;

@end
