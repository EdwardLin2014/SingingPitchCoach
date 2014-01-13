//
//  Note.m
//  SingingPitchCoach
//
//  Created by Edward on 7/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import "Note.h"

@implementation Note

- (id)initWithPitch:(NSString*)setPitch
       AndTempoRate:(float)setTempoRate
       AndDuration:(NSString *)setDuration
       AndPlayDemo:(Boolean)setPlayDemo
{
    if (self = [super init])
    {
        pitch = setPitch;
        tempoRate = setTempoRate;
        
        if ([setDuration isEqualToString:@"eighth"])
            duration = tempoRate*31/458;
        else if ([setDuration isEqualToString:@"quarter"])
            duration = tempoRate*63/458;
        else if ([setDuration isEqualToString:@"half"])
            duration = tempoRate*126/458;
        else if ([setDuration isEqualToString:@"full"])
            duration = tempoRate*252/458;
        
        playDemo = setPlayDemo;
        isPlayed = NO;
    }

    return self;
}

- (void)setUI:(SKSpriteNode*)setUI
{
    UI = setUI;
}

- (NSString*)getPitch
{
    return pitch;
}

- (CFTimeInterval)getDurationInTime
{
    return duration;
}

- (NSString*)getDurationInString
{
    if (duration == tempoRate*31/458)
        return @"eighth";
    else if (duration == tempoRate*63/458)
        return @"quarter";
    else if (duration == tempoRate*126/458)
        return @"half";
    else if (duration == tempoRate*252/458)
        return @"full";
    else
        return @"unknown";
}

- (Boolean)getPlayDemo
{
    return playDemo;
}

- (SKSpriteNode*)getUI
{
    return UI;
}

- (Boolean)isPlayed
{
    return isPlayed;
}

- (void)resetPlayed
{
   isPlayed = NO;
}

- (void)play
{
    isPlayed = YES;
}

@end
