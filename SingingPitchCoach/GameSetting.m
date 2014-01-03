//
//  GameSetting.m
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import "GameSetting.h"
#import "StartScene.h"

@implementation GameSetting

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        userDefaults = [NSUserDefaults standardUserDefaults];
        
        /* Add background - Begin */
        self.backgroundColor = [SKColor colorWithRed:0.35 green:0.45 blue:0.23 alpha:1.0];
        
        // sampleRate:  16000, 44100
        //kBufferSize
    
        // Save and Return
        SKLabelNode *saveLabel = [[SKLabelNode alloc] init];
        saveLabel.name = @"Save";
        saveLabel.text = @"Save";
        saveLabel.fontSize = 15;
        saveLabel.position = CGPointMake(500,280);
        [self addChild:saveLabel];
        
        NSLog(@"saveLabel Position x: %f; Position y:%f", saveLabel.position.x, saveLabel.position.y);
        NSLog(@"saveLabel Width: %f; Height: %f", saveLabel.frame.size.width, saveLabel.frame.size.height);
        /* Add background - End */
    }
    
    return self;
}

-(void)didMoveToView:(SKView *)view
{
    // percentageOfOverlap (Label)
    overlapLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 43, 100, 31)];
    overlapLabel.textColor = [UIColor whiteColor];
    overlapLabel.font = [UIFont systemFontOfSize:14];
    overlapLabel.text = @"Overlap";
    [self.view addSubview:overlapLabel];

    // percentageOfOverlap (textField)
    overlapTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, 290, 20)];
    overlapTextField.borderStyle = UITextBorderStyleRoundedRect;
    overlapTextField.textColor = [UIColor blackColor];
    overlapTextField.font = [UIFont systemFontOfSize:14];
    overlapTextField.text = [NSString stringWithFormat:@"%d",[userDefaults integerForKey:@"percentageOfOverlap"]];
    overlapTextField.placeholder = @"Enter Percentage Of Frame Overlap (0-99)";
    overlapTextField.backgroundColor = [UIColor whiteColor];
    overlapTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    overlapTextField.keyboardType = UIKeyboardTypeNumberPad;
    overlapTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:overlapTextField];
    
    NSLog(@"saveLabel Position x: %f; Position y:%f", overlapTextField.frame.origin.x, overlapTextField.frame.origin.y);
    NSLog(@"saveLabel Width: %f; Height: %f", overlapTextField.frame.size.width, overlapTextField.frame.size.height);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [overlapTextField resignFirstResponder];
    
    /* Called when a touch begins */
    for (UITouch *touch in touches)
    {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if(n!=self && [n.name isEqual: @"Save"])
        {
            [userDefaults setInteger:[overlapTextField.text integerValue] forKey:@"percentageOfOverlap"];
            [overlapLabel removeFromSuperview];
            [overlapTextField removeFromSuperview];
            
            [userDefaults synchronize];
            
            StartScene* home = [[StartScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:home transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
        }
    }
}

@end
