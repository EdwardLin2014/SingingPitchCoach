//
//  Coaching.m
//  SingingPitchCoach
//
//  Created by Edward on 31/12/13.
//  Copyright (c) 2013 Edward. All rights reserved.
//

#import "Coaching.h"
#import "StartScene.h"
#import "PitchDetector.h"

@implementation Coaching

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Add background - Begin */
        SKTextureAtlas *backgroundAtlas = [SKTextureAtlas atlasNamed:@"background"];
        SKSpriteNode *pianoRoll = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5PianoRoll"]];
        pianoRoll.position = CGPointMake(43, (CGRectGetMidY(self.frame)-10));
        pianoRoll.zPosition = 2;
        [self addChild:pianoRoll];
        
        NSLog(@"CSC5PianoRoll Position x: %f; Position y:%f", pianoRoll.position.x,pianoRoll.position.y);
        NSLog(@"CSC5PianoRoll Width: %f; Height: %f", pianoRoll.size.width, pianoRoll.size.height);
        
        SKSpriteNode *score = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5Score"]];
        score.position = CGPointMake(315, (CGRectGetMidY(self.frame)-10));
        score.zPosition = 0;
        [self addChild:score];
        
        NSLog(@"CSC5Score Position x: %f; Position y:%f", score.position.x,score.position.y);
        NSLog(@"CSC5Score Width: %f; Height: %f", score.size.width, score.size.height);
        
        indicator = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"indicator"]];
        indicator.position = CGPointMake(15, -8);
        indicator.zPosition = 3;
        [self addChild:indicator];
        
        NSLog(@"indicator Position x: %f; Position y:%f", indicator.position.x,indicator.position.y);
        NSLog(@"indicator Width: %f; Height: %f", indicator.size.width, indicator.size.height);
        /* Add background - End */
        
        /* start the mic */
        pitchDetector = [PitchDetector sharedDetector];
        if (![pitchDetector isDetectorRunning])
            [pitchDetector TurnOnMicrophone:self];

    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* stop the mic */
    [pitchDetector TurnOffMicrophone];
    
    StartScene* home = [[StartScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
   [self.scene.view presentScene:home transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
}

-(int)pitchToPosition:(NSString *)pitch
{
    if ([pitch isEqualToString:@"C5"])          return 317;
    else if ([pitch isEqualToString:@"B4"])     return 304;
    else if ([pitch isEqualToString:@"A#4"])    return 291;
    else if ([pitch isEqualToString:@"A4"])     return 278;
    else if ([pitch isEqualToString:@"G#4"])    return 265;
    else if ([pitch isEqualToString:@"G4"])     return 252;
    else if ([pitch isEqualToString:@"F#4"])    return 239;
    else if ([pitch isEqualToString:@"F4"])     return 226;
    else if ([pitch isEqualToString:@"E4"])     return 213;
    else if ([pitch isEqualToString:@"D#4"])    return 200;
    else if ([pitch isEqualToString:@"D4"])     return 187;
    else if ([pitch isEqualToString:@"C#4"])    return 174;
    else if ([pitch isEqualToString:@"C4"])     return 161;
    else if ([pitch isEqualToString:@"B3"])     return 148;
    else if ([pitch isEqualToString:@"A#3"])    return 135;
    else if ([pitch isEqualToString:@"A3"])     return 122;
    else if ([pitch isEqualToString:@"G#3"])    return 109;
    else if ([pitch isEqualToString:@"G3"])     return 96;
    else if ([pitch isEqualToString:@"F#3"])    return 83;
    else if ([pitch isEqualToString:@"F3"])     return 70;
    else if ([pitch isEqualToString:@"E3"])     return 57;
    else if ([pitch isEqualToString:@"D#3"])    return 44;
    else if ([pitch isEqualToString:@"D3"])     return 31;
    else if ([pitch isEqualToString:@"C#3"])    return 18;
    else if ([pitch isEqualToString:@"C3"])     return 5;
    else                                        return -8;
}

-(int)midiToPosition:(int)midi
{
    switch (midi)
    {
/*
        case 72:        return 317;
        case 71:        return 304;
        case 70:        return 291;
        case 69:        return 278;
        case 68:        return 265;
        case 67:        return 252;
        case 66:        return 239;
        case 65:        return 226;
        case 64:        return 213;
        case 63:        return 200;
        case 62:        return 187;
        case 61:        return 174;
        case 60:        return 161;
        case 59:        return 148;
        case 58:        return 135;
        case 57:        return 122;
        case 56:        return 109;
        case 55:        return 96;
        case 54:        return 83;
        case 53:        return 70;
        case 52:        return 57;
        case 51:        return 44;
        case 50:        return 31;
        case 49:        return 18;
        case 48:        return 5;
        case 47:        return -8;
*/
            
        case 72:        return 304;
        case 71:        return 282;
        case 70:        return 278;
        case 69:        return 265;
        case 68:        return 252;
        case 67:        return 239;
        case 66:        return 226;
        case 65:        return 213;
        case 64:        return 200;
        case 63:        return 187;
        case 62:        return 174;
        case 61:        return 161;
        case 60:        return 148;
        case 59:        return 135;
        case 58:        return 122;
        case 57:        return 109;
        case 56:        return 96;
        case 55:        return 83;
        case 54:        return 70;
        case 53:        return 57;
        case 52:        return 44;
        case 51:        return 31;
        case 50:        return 18;
        case 49:        return 5;
        case 48:        return -8;
        case 47:        return -21;
        default:
            if (midi<47)
                return -34;
            else
                return 330;
    }
}

-(void)moveIndicatorByPitch:(NSString *)pitch
{
    SKAction *easeMove = [SKAction moveToY:[self pitchToPosition:pitch] duration:0.2f];
    easeMove.timingMode = SKActionTimingEaseInEaseOut;
    [indicator runAction:easeMove];
}

-(void)moveIndicatorByMIDI:(int)midi
{
    SKAction *easeMove = [SKAction moveToY:[self midiToPosition:midi] duration:0.2f];
    easeMove.timingMode = SKActionTimingEaseInEaseOut;
    [indicator runAction:easeMove];
}

@end
