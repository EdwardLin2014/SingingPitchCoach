//
//  MyScene.m
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import "StartScene.h"
#import "Coaching.h"
#import "GameSetting.h"

@implementation StartScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        NSLog(@"SKScene:initWithSize %f x %f", size.width, size.height);
        
        /* Setup Pitch Detector */
        pitchDetector = [PitchDetector sharedDetector];
        
        /* Setup Start Menu */
        self.backgroundColor = [SKColor whiteColor];
        
        /* Start Game Label */
        SKLabelNode *startLabel = [[SKLabelNode alloc] init];
        startLabel.name = @"startLabel";
        startLabel.text = @"Start Coaching!";
        startLabel.scale = 0.5;
        startLabel.fontColor = [SKColor blackColor];
        startLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.6);
        [self addChild:startLabel];
        
        /* Game Setting Label */
        SKLabelNode *gameSettingLabel = [[SKLabelNode alloc] init];
        gameSettingLabel.name = @"gameSettingLabel";
        gameSettingLabel.text = @"Game Setting";
        gameSettingLabel.scale = 0.5;
        gameSettingLabel.fontColor = [SKColor blackColor];
        gameSettingLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.4);
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
        if(n!=self && [n.name isEqual: @"startLabel"])
        {
            Coaching* coaching = [[Coaching alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:coaching transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
        
        if(n!=self && [n.name isEqual: @"gameSettingLabel"])
        {
            GameSetting* gameSetting = [[GameSetting alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:gameSetting transition:[SKTransition doorsOpenHorizontalWithDuration:1.0]];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end
