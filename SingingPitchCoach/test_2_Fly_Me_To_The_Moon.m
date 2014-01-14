//
//  test_2_Fly_Me_To_The_Moon.m
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import "test_2_Fly_Me_To_The_Moon.h"
#import "TestingScene.h"

@implementation test_2_Fly_Me_To_The_Moon

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    TestingScene* home = [[TestingScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [self.scene.view presentScene:home transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
}

-(int)midiToPosition:(int)midi
{
    switch (midi)
    {
        case 72:        return C5_y;
        case 71:        return B4_y;
        case 70:        return ASharp4_y;
        case 69:        return A4_y;
        case 68:        return GSharp4_y;
        case 67:        return G4_y;
        case 66:        return FSharp4_y;
        case 65:        return F4_y;
        case 64:        return E4_y;
        case 63:        return DSharp4_y;
        case 62:        return D4_y;
        case 61:        return CSharp4_y;
        case 60:        return C4_y;
        case 59:        return B3_y;
        case 58:        return ASharp3_y;
        case 57:        return A3_y;
        case 56:        return GSharp3_y;
        case 55:        return G3_y;
        case 54:        return FSharp3_y;
        case 53:        return F3_y;
        case 52:        return E3_y;
        case 51:        return DSharp3_y;
        case 50:        return D3_y;
        case 49:        return CSharp3_y;
        case 48:        return C3_y;
        default:
            if (midi<48)
                return -34;
            else
                return 330;
    }
}
-(void)moveIndicatorByMIDI:(int)midi
{
    if (indicator.hidden)
        return;
    
    SKAction *easeMove = [SKAction moveToY:[self midiToPosition:midi] duration:0.2f];
    easeMove.timingMode = SKActionTimingEaseInEaseOut;
    [indicator runAction:easeMove];
}

@end
