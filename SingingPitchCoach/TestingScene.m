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
        SKLabelNode *test_2_Fly_Me_To_The_Moon = [[SKLabelNode alloc] init];
        test_2_Fly_Me_To_The_Moon.name = @"2_FlyMeToTheMoon";
        test_2_Fly_Me_To_The_Moon.text = @"2_FlyMeToTheMoon";
        test_2_Fly_Me_To_The_Moon.fontSize = 14;
        test_2_Fly_Me_To_The_Moon.fontColor = [SKColor blackColor];
        test_2_Fly_Me_To_The_Moon.position = CGPointMake(self.frame.size.width/4*2-10, self.frame.size.height/2+40);
        [self addChild:test_2_Fly_Me_To_The_Moon];

        SKLabelNode *test_4_My_Heart_Will_Go_On = [[SKLabelNode alloc] init];
        test_4_My_Heart_Will_Go_On.name = @"4_MyHeartWillGoOn";
        test_4_My_Heart_Will_Go_On.text = @"4_MyHeartWillGoOn";
        test_4_My_Heart_Will_Go_On.fontSize = 14;
        test_4_My_Heart_Will_Go_On.fontColor = [SKColor blackColor];
        test_4_My_Heart_Will_Go_On.position = CGPointMake(self.frame.size.width/4*2-10, self.frame.size.height/2-40);
        [self addChild:test_4_My_Heart_Will_Go_On];
        /* --------------------------- 2nd and 4th Test------------------------------- END */
        
        /* --------------------------------- 3th Test  --------------------------------- BEGIN */
        SKLabelNode *test_3_Major_Scale = [[SKLabelNode alloc] init];
        test_3_Major_Scale.name = @"3_Major_Scale";
        test_3_Major_Scale.text = @"3_Major_Scale";
        test_3_Major_Scale.fontSize = 16;
        test_3_Major_Scale.fontColor = [SKColor blackColor];
        test_3_Major_Scale.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*5);
        [self addChild:test_3_Major_Scale];
        
        SKLabelNode *test_3_Minor_Scale = [[SKLabelNode alloc] init];
        test_3_Minor_Scale.name = @"3_Minor_Scale";
        test_3_Minor_Scale.text = @"3_Minor_Scale";
        test_3_Minor_Scale.fontSize = 16;
        test_3_Minor_Scale.fontColor = [SKColor blackColor];
        test_3_Minor_Scale.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*4);
        [self addChild:test_3_Minor_Scale];
        
        SKLabelNode *test_3_Arpeggios = [[SKLabelNode alloc] init];
        test_3_Arpeggios.name = @"3_Arpeggios";
        test_3_Arpeggios.text = @"3_Arpeggios";
        test_3_Arpeggios.fontSize = 16;
        test_3_Arpeggios.fontColor = [SKColor blackColor];
        test_3_Arpeggios.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*3);
        [self addChild:test_3_Arpeggios];
        
        SKLabelNode *test_3_Arpeggios_7th = [[SKLabelNode alloc] init];
        test_3_Arpeggios_7th.name = @"3_Arpeggios_7th";
        test_3_Arpeggios_7th.text = @"3_Arpeggios_7th";
        test_3_Arpeggios_7th.fontSize = 16;
        test_3_Arpeggios_7th.fontColor = [SKColor blackColor];
        test_3_Arpeggios_7th.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6*2);
        [self addChild:test_3_Arpeggios_7th];
        /* --------------------------------- 3th Test  --------------------------------- END */
        
        /* Game Setting Label - Configure Tempo for 3th Test Only */
        SKLabelNode *gameSettingLabel = [[SKLabelNode alloc] init];
        gameSettingLabel.name = @"gameSettingLabel";
        gameSettingLabel.text = @"Game Setting";
        gameSettingLabel.fontSize = 16;
        gameSettingLabel.fontColor = [SKColor blackColor];
        gameSettingLabel.position = CGPointMake(self.frame.size.width/4*3+25, self.frame.size.height/6);
        [self addChild:gameSettingLabel];
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
        if(n!=self && [n.name isEqual: @"2_FlyMeToTheMoon"])
        {
            test_2_Fly_Me_To_The_Moon* test2_Fly_Me_To_The_Moon = [[test_2_Fly_Me_To_The_Moon alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test2_Fly_Me_To_The_Moon transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"4_MyHeartWillGoOn"])
        {
            test_4_My_Heart_Will_Go_On* test4_My_Heart_Will_Go_On = [[test_4_My_Heart_Will_Go_On alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test4_My_Heart_Will_Go_On transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        /* --------------------------- 2nd and 4th Test------------------------------- END */
        
        /* --------------------------------- 3th Test  --------------------------------- BEGIN */
        if(n!=self && [n.name isEqual: @"3_Major_Scale"])
        {
            test_3_Major_Scale* test3_Major_Scale = [[test_3_Major_Scale alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test3_Major_Scale transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"3_Minor_Scale"])
        {
            test_3_Minor_Scale* test3_Minor_Scale = [[test_3_Minor_Scale alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test3_Minor_Scale transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"3_Arpeggios"])
        {
            test_3_Arpeggios* test3_Arpeggios = [[test_3_Arpeggios alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test3_Arpeggios transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"3_Arpeggios_7th"])
        {
            test_3_Arpeggios_7th* test3_Arpeggios_7th = [[test_3_Arpeggios_7th alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:test3_Arpeggios_7th transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
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
@end
