//
//  GameSetting.h
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class PitchDetector;

@interface GameSetting : SKScene
{
    NSUserDefaults *userDefaults;
    
    UILabel *overlapLabel;
    UITextField *overlapTextField;

    UILabel *frameSizeLabel;
    UITextField *frameSizeTextField;
    
    UILabel *tempoLabel;
    UITextField *tempoTextField;
    
    PitchDetector *pitchDetector;
}

-(void)resetPitchDetector;

@end
