//
//  TestingScene.h
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PitchDetector.h"

@interface TestingScene : SKScene
{
    SKLabelNode *test_2_Fly_Me_To_The_Moon_Label;
    SKLabelNode *test_4_My_Heart_Will_Go_On_Label;
    
    SKLabelNode *test_3_Major_Scale_Label;
    SKLabelNode *test_3_Minor_Scale_Label;
    SKLabelNode *test_3_Arpeggios_Label;
    SKLabelNode *test_3_Arpeggios_7th_Label;
    
    bool test_2_isTouch;
    bool test_4_isTouch;
    bool test_3_Major_isTouch;
    bool test_3_Minor_isTouch;
    bool test_3_Arpeggios_isTouch;
    bool test_3_Arpeggios7th_isTouch;
}
@end
