//
//  TestingScene.m
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import "TestingScene.h"

#import "test_1_4096_0.h"
#import "test_1_4096_50.h"
#import "test_1_8192_0.h"
#import "test_1_8192_50.h"
#import "test_1_16384_0.h"
#import "test_1_16384_50.h"

#import "test_2_Fly_Me_To_The_Moon.h"
#import "test_4_My_Heart_Will_Go_On.h"

#import "test_3_Major_Scale.h"
#import "test_3_Minor_Scale.h"
#import "test_3_Arpeggios.h"
#import "test_3_Arpeggios_7th.h"

#import "GameSetting.h"

@implementation TestingScene
-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        NSLog(@"SKScene:initWithSize %f x %f", size.width, size.height);
        
        self.backgroundColor = [SKColor whiteColor];
        
        /* --------------------------------- 1st Test  --------------------------------- BEGIN */
        SKLabelNode *test_1_4096_0 = [[SKLabelNode alloc] init];
        test_1_4096_0.name = @"1_4096_0";
        test_1_4096_0.text = @"1_4096_0";
        test_1_4096_0.fontSize = 16;
        test_1_4096_0.fontColor = [SKColor blackColor];
        test_1_4096_0.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7*6);
        [self addChild:test_1_4096_0];
        
        SKLabelNode *test_1_4096_50 = [[SKLabelNode alloc] init];
        test_1_4096_50.name = @"1_4096_50";
        test_1_4096_50.text = @"1_4096_50";
        test_1_4096_50.fontSize = 16;
        test_1_4096_50.fontColor = [SKColor blackColor];
        test_1_4096_50.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7*5);
        [self addChild:test_1_4096_50];
        
        SKLabelNode *test_1_8192_0 = [[SKLabelNode alloc] init];
        test_1_8192_0.name = @"1_8192_0";
        test_1_8192_0.text = @"1_8192_0";
        test_1_8192_0.fontSize = 16;
        test_1_8192_0.fontColor = [SKColor blackColor];
        test_1_8192_0.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7*4);
        [self addChild:test_1_8192_0];
        
        SKLabelNode *test_1_8192_50 = [[SKLabelNode alloc] init];
        test_1_8192_50.name = @"1_8192_50";
        test_1_8192_50.text = @"1_8192_50";
        test_1_8192_50.fontSize = 16;
        test_1_8192_50.fontColor = [SKColor blackColor];
        test_1_8192_50.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7*3);
        [self addChild:test_1_8192_50];
        
        SKLabelNode *test_1_16384_0 = [[SKLabelNode alloc] init];
        test_1_16384_0.name = @"1_16384_0";
        test_1_16384_0.text = @"1_16384_0";
        test_1_16384_0.fontSize = 16;
        test_1_16384_0.fontColor = [SKColor blackColor];
        test_1_16384_0.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7*2);
        [self addChild:test_1_16384_0];
        
        SKLabelNode *test_1_16384_50 = [[SKLabelNode alloc] init];
        test_1_16384_50.name = @"1_16384_50";
        test_1_16384_50.text = @"1_16384_50";
        test_1_16384_50.fontSize = 16;
        test_1_16384_50.fontColor = [SKColor blackColor];
        test_1_16384_50.position = CGPointMake(self.frame.size.width/4-50, self.frame.size.height/7);
        [self addChild:test_1_16384_50];
        /* --------------------------------- 1st Test  --------------------------------- END */
        
        /* --------------------------- 2nd and 4th Test------------------------------- BEGIN */
        test_2_Fly_Me_To_The_Moon_Label = [[SKLabelNode alloc] init];
        test_2_Fly_Me_To_The_Moon_Label.name = @"2_FlyMeToTheMoon";
        test_2_Fly_Me_To_The_Moon_Label.text = @"2_FlyMeToTheMoon";
        test_2_Fly_Me_To_The_Moon_Label.fontSize = 14;
        test_2_Fly_Me_To_The_Moon_Label.fontColor = [SKColor blackColor];
        test_2_Fly_Me_To_The_Moon_Label.position = CGPointMake(self.frame.size.width/4*2-10, self.frame.size.height/2+40);
        [self addChild:test_2_Fly_Me_To_The_Moon_Label];

        test_4_My_Heart_Will_Go_On_Label = [[SKLabelNode alloc] init];
        test_4_My_Heart_Will_Go_On_Label.name = @"4_MyHeartWillGoOn";
        test_4_My_Heart_Will_Go_On_Label.text = @"4_MyHeartWillGoOn";
        test_4_My_Heart_Will_Go_On_Label.fontSize = 14;
        test_4_My_Heart_Will_Go_On_Label.fontColor = [SKColor blackColor];
        test_4_My_Heart_Will_Go_On_Label.position = CGPointMake(self.frame.size.width/4*2-10, self.frame.size.height/2-40);
        [self addChild:test_4_My_Heart_Will_Go_On_Label];
        /* --------------------------- 2nd and 4th Test------------------------------- END */
        
        /* --------------------------------- 3th Test  --------------------------------- BEGIN */
        test_3_Major_Scale_Label = [[SKLabelNode alloc] init];
        test_3_Major_Scale_Label.name = @"3_Major_Scale";
        test_3_Major_Scale_Label.text = @"3_Major_Scale";
        test_3_Major_Scale_Label.fontSize = 16;
        test_3_Major_Scale_Label.fontColor = [SKColor blackColor];
        test_3_Major_Scale_Label.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*5);
        [self addChild:test_3_Major_Scale_Label];
        
        test_3_Minor_Scale_Label = [[SKLabelNode alloc] init];
        test_3_Minor_Scale_Label.name = @"3_Minor_Scale";
        test_3_Minor_Scale_Label.text = @"3_Minor_Scale";
        test_3_Minor_Scale_Label.fontSize = 16;
        test_3_Minor_Scale_Label.fontColor = [SKColor blackColor];
        test_3_Minor_Scale_Label.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*4);
        [self addChild:test_3_Minor_Scale_Label];
        
        test_3_Arpeggios_Label = [[SKLabelNode alloc] init];
        test_3_Arpeggios_Label.name = @"3_Arpeggios";
        test_3_Arpeggios_Label.text = @"3_Arpeggios";
        test_3_Arpeggios_Label.fontSize = 16;
        test_3_Arpeggios_Label.fontColor = [SKColor blackColor];
        test_3_Arpeggios_Label.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*3);
        [self addChild:test_3_Arpeggios_Label];
        
        test_3_Arpeggios_7th_Label = [[SKLabelNode alloc] init];
        test_3_Arpeggios_7th_Label.name = @"3_Arpeggios_7th";
        test_3_Arpeggios_7th_Label.text = @"3_Arpeggios_7th";
        test_3_Arpeggios_7th_Label.fontSize = 16;
        test_3_Arpeggios_7th_Label.fontColor = [SKColor blackColor];
        test_3_Arpeggios_7th_Label.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*2);
        [self addChild:test_3_Arpeggios_7th_Label];
        /* --------------------------------- 3th Test  --------------------------------- END */
        
        /* Game Setting Label - Configure Tempo for 3th Test Only */
        SKLabelNode *gameSettingLabel = [[SKLabelNode alloc] init];
        gameSettingLabel.name = @"gameSettingLabel";
        gameSettingLabel.text = @"Game Setting";
        gameSettingLabel.fontSize = 16;
        gameSettingLabel.fontColor = [SKColor blackColor];
        gameSettingLabel.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6);
        [self addChild:gameSettingLabel];
        
        test_2_isTouch = NO;
        test_4_isTouch = NO;
        test_3_Major_isTouch = NO;
        test_3_Minor_isTouch = NO;
        test_3_Arpeggios_isTouch = NO;
        test_3_Arpeggios7th_isTouch = NO;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    for (UITouch *touch in touches)
    {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        
        /* --------------------------------- 1st Test  --------------------------------- BEGIN */
        if(n!=self && [n.name isEqual: @"1_4096_0"])
        {
            test_1_4096_0* test1_4096_0 = [[test_1_4096_0 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_4096_0 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"1_4096_50"])
        {
            test_1_4096_50* test1_4096_50 = [[test_1_4096_50 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_4096_50 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"1_8192_0"])
        {
            test_1_8192_0* test1_8192_0 = [[test_1_8192_0 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_8192_0 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"1_8192_50"])
        {
            test_1_8192_50* test1_8192_50 = [[test_1_8192_50 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_8192_50 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"1_16384_0"])
        {
            test_1_16384_0* test1_16384_0 = [[test_1_16384_0 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_16384_0 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"1_16384_50"])
        {
            test_1_16384_50* test1_16384_50 = [[test_1_16384_50 alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test1_16384_50 transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        /* --------------------------------- 1st Test  --------------------------------- END */
        
        /* --------------------------- 2nd and 4th Test------------------------------- BEGIN */
        if(n!=self && [n.name isEqual: @"2_FlyMeToTheMoon"] && !test_2_isTouch && ![test_2_Fly_Me_To_The_Moon_Label.text isEqualToString:@"Loading..."])
        {
            test_2_Fly_Me_To_The_Moon_Label.text = @"Loading...";
            test_2_isTouch = YES;
        }
        
        if(n!=self && [n.name isEqual: @"4_MyHeartWillGoOn"] && !test_4_isTouch && ![test_4_My_Heart_Will_Go_On_Label.text isEqualToString:@"Loading..."])
        {
            test_4_My_Heart_Will_Go_On_Label.text = @"Loading...";
            test_4_isTouch = YES;
        }
        /* --------------------------- 2nd and 4th Test------------------------------- END */
        
        /* --------------------------------- 3th Test  --------------------------------- BEGIN */
        if(n!=self && [n.name isEqual: @"3_Major_Scale"] && !test_3_Major_isTouch && ![test_3_Major_Scale_Label.text isEqualToString:@"Loading..."])
        {
            test_3_Major_Scale_Label.text = @"Loading...";
            test_3_Major_isTouch = YES;
        }
        
        if(n!=self && [n.name isEqual: @"3_Minor_Scale"] && !test_3_Minor_isTouch && ![test_3_Minor_Scale_Label.text isEqualToString:@"Loading..."])
        {
            test_3_Minor_Scale_Label.text = @"Loading...";
            test_3_Minor_isTouch = YES;
        }
        
        if(n!=self && [n.name isEqual: @"3_Arpeggios"] && !test_3_Arpeggios_isTouch && ![test_3_Arpeggios_Label.text isEqualToString:@"Loading..."])
        {
            test_3_Arpeggios_Label.text = @"Loading...";
            test_3_Arpeggios_isTouch = YES;
        }
        
        if(n!=self && [n.name isEqual: @"3_Arpeggios_7th"] && !test_3_Arpeggios7th_isTouch && ![test_3_Arpeggios_7th_Label.text isEqualToString:@"Loading..."])
        {
            test_3_Arpeggios_7th_Label.text = @"Loading...";
            test_3_Arpeggios7th_isTouch = YES;
        }
        /* --------------------------------- 3th Test  --------------------------------- END */
        
        /* Game Setting Label - Configure Tempo for 3th Test Only */
        if(n!=self && [n.name isEqual: @"gameSettingLabel"])
        {
            GameSetting* gameSetting = [[GameSetting alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:gameSetting transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
    }
}

-(void)changeScene
{
    if (test_2_isTouch)
    {
        test_2_isTouch = NO;
        
        test_2_Fly_Me_To_The_Moon* test2_Fly_Me_To_The_Moon = [[test_2_Fly_Me_To_The_Moon alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test2_Fly_Me_To_The_Moon transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
    
    if (test_4_isTouch)
    {
        test_4_isTouch = NO;
        
        test_4_My_Heart_Will_Go_On* test4_My_Heart_Will_Go_On = [[test_4_My_Heart_Will_Go_On alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test4_My_Heart_Will_Go_On transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
    
    if (test_3_Major_isTouch)
    {
        test_3_Major_isTouch = NO;
        
        test_3_Major_Scale* test3_Major_Scale = [[test_3_Major_Scale alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test3_Major_Scale transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
    
    if (test_3_Minor_isTouch)
    {
        test_3_Minor_isTouch = NO;
        
        test_3_Minor_Scale* test3_Minor_Scale = [[test_3_Minor_Scale alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test3_Minor_Scale transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
    
    if (test_3_Arpeggios_isTouch)
    {
        test_3_Arpeggios_isTouch = NO;
        
        test_3_Arpeggios* test3_Arpeggios = [[test_3_Arpeggios alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test3_Arpeggios transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
    
    if (test_3_Arpeggios7th_isTouch)
    {
        test_3_Arpeggios7th_isTouch = NO;
        
        test_3_Arpeggios_7th* test3_Arpeggios_7th = [[test_3_Arpeggios_7th alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
        [self.scene.view presentScene:test3_Arpeggios_7th transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    [self changeScene];
}

@end
