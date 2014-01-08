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
        self.backgroundColor = [SKColor whiteColor];
        
        SKTextureAtlas *backgroundAtlas = [SKTextureAtlas atlasNamed:@"background"];
        
        SKSpriteNode *score = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5Score"]];
        score.position = CGPointMake(315, (CGRectGetMidY(self.frame)-10));
        score.zPosition = 0;
        [self addChild:score];
        
        NSLog(@"CSC5Score Position x: %f; Position y:%f", score.position.x,score.position.y);
        NSLog(@"CSC5Score Width: %f; Height: %f", score.size.width, score.size.height);
        
        pianoRoll = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5PianoRoll"]];
        pianoRoll.position = CGPointMake(43, (CGRectGetMidY(self.frame)-10));
        pianoRoll.zPosition = 1;
        [self addChild:pianoRoll];
        
        SKSpriteNode* pianoRollBK = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5PianoRoll"]];
        pianoRollBK.position = CGPointMake(43, (CGRectGetMidY(self.frame)-10));
        pianoRollBK.zPosition = 2;
        [self addChild:pianoRollBK];
        
        NSLog(@"CSC5PianoRoll Position x: %f; Position y:%f", pianoRoll.position.x,pianoRoll.position.y);
        NSLog(@"CSC5PianoRoll Width: %f; Height: %f", pianoRoll.size.width, pianoRoll.size.height);
        
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
        
        // Calculate Animation Speed
        userDefaults = [NSUserDefaults standardUserDefaults];
        tempoRate = 7.5*60/[userDefaults integerForKey:@"tempo"];
        animationSpeed = tempoRate*710.5/458;
        
        // Create Score 1
        notePos = -2;
        score1[0] = [[Note alloc] initWithPitch:@"C3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[1] = [[Note alloc] initWithPitch:@"D3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[2] = [[Note alloc] initWithPitch:@"E3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[3] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[4] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[5] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[6] = [[Note alloc] initWithPitch:@"B3" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        score1[7] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"full" AndPlayDemo:NO];
        
        // Create Score 2
        /*
        score1[0] = [[Note alloc] initWithPitch:@"C3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[1] = [[Note alloc] initWithPitch:@"D3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[2] = [[Note alloc] initWithPitch:@"E3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[3] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[4] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[5] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[6] = [[Note alloc] initWithPitch:@"B3" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        score1[7] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"half" AndPlayDemo:NO];
        */
        
        // Create Score 3
        /*
        score1[0] = [[Note alloc] initWithPitch:@"C3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[1] = [[Note alloc] initWithPitch:@"D3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[2] = [[Note alloc] initWithPitch:@"E3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[3] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[4] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[5] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[6] = [[Note alloc] initWithPitch:@"B3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score1[7] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        */
        
        // Create Score 4
        /*
        score1[0] = [[Note alloc] initWithPitch:@"C3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[1] = [[Note alloc] initWithPitch:@"D3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[2] = [[Note alloc] initWithPitch:@"E3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[3] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[4] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[5] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[6] = [[Note alloc] initWithPitch:@"B3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score1[7] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        */
        
        NSLog(@"tempo: %d", [userDefaults integerForKey:@"tempo"]);
        NSLog(@"animationSpeed: %f", animationSpeed);
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

#pragma mark Scores
-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    
    /* Add Score - Begin */
    // Score 1
    static CFTimeInterval nextNoteTime = 0;
    
    if (notePos == -2 && currentTime >= nextNoteTime)
    {
        nextNoteTime = currentTime + 2;
        
        readyLabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        readyLabel.name = @"readyLabel";
        readyLabel.text = @"Ready?";
        readyLabel.fontSize = 40;
        readyLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        readyLabel.fontColor = [SKColor yellowColor];
        [self addChild:readyLabel];
        
        SKAction *labelReadyAction = [SKAction fadeInWithDuration:1];
        [readyLabel runAction:labelReadyAction];
        [self playSound:@"ready"];

        NSLog(@"%d: nextNoteTime: %f, currentTime: %f", notePos, nextNoteTime, currentTime);
        
        notePos++;
    }
    else if (notePos == -1 && currentTime >= nextNoteTime)
    {
        nextNoteTime = currentTime + 0.5;
        
        [readyLabel removeFromParent];
        
        goLabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        goLabel.name = @"goLabel";
        goLabel.text = @"GO!";
        goLabel.fontSize = 40;
        goLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        goLabel.fontColor = [SKColor yellowColor];
        [self addChild:goLabel];
        
        SKAction *labelGoAction = [SKAction fadeInWithDuration:0.25];
        [goLabel runAction:labelGoAction];
        [self playSound:@"go"];
        
        NSLog(@"%d: nextNoteTime: %f, currentTime: %f", notePos, nextNoteTime, currentTime);
        
        notePos++;
    }
    else if(notePos<8 && currentTime >= nextNoteTime)
    {
        if (notePos == 0)
            [goLabel removeFromParent];
        
        nextNoteTime = currentTime + [score1[notePos] getDurationInTime];
        NSLog(@"%d: nextNoteTime: %f, currentTime: %f, duration: %f", notePos, nextNoteTime, currentTime, [score1[notePos] getDurationInTime]);
        
//        [self playFullNote:[score1[notePos] getPitch]];
        [self playNote:score1[notePos]];
        notePos++;
    }
    /* Add Score - End */
    
    /* Check Whether score meet piano roll. If yes, play sound! - Begin */
    for (int i=0; i<8; i++)
    {
        if([score1[i] getUI].hidden || [score1[i] isPlayed])
            continue;
        
        if ([[score1[i] getUI] intersectsNode:pianoRoll])
        {
            [score1[i] play];
            
            NSString *tmp = [score1[i] getPitch];
            if ([[score1[i] getDurationInString] isEqualToString:@"eighth"])
                tmp = [tmp stringByAppendingString:@"_8"];
            else if ([[score1[i] getDurationInString] isEqualToString:@"quarter"])
                tmp = [tmp stringByAppendingString:@"_4"];
            else if ([[score1[i] getDurationInString] isEqualToString:@"half"])
                tmp = [tmp stringByAppendingString:@"_2"];
            else if ([[score1[i] getDurationInString] isEqualToString:@"full"])
                tmp = [tmp stringByAppendingString:@"_1"];
            else
            {
                NSLog(@"cannot find the duration?");
                continue;
            }

            [self playSound:tmp];
        }
    }
    /* Check Whether score meet piano roll. If yes, play sound! - End */
    
}

-(void)playNote:(Note *)note
{
    SKTextureAtlas *notesAtlas = [SKTextureAtlas atlasNamed:@"notes"];
    SKSpriteNode *noteUI;
    SKAction *linearMove;
    
    if ([[note getDurationInString] isEqualToString:@"eighth"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"EighthNote"]];
        noteUI.position = CGPointMake(574, [self pitchToPosition:[note getPitch]]);
        
        linearMove = [SKAction moveToX:-136.5 duration:animationSpeed];
    }
    else if ([[note getDurationInString] isEqualToString:@"quarter"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"QuarterNote"]];
        noteUI.position = CGPointMake(590, [self pitchToPosition:[note getPitch]]);

        linearMove = [SKAction moveToX:-120.5 duration:animationSpeed];
    }
    else if ([[note getDurationInString] isEqualToString:@"half"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"HalfNote"]];
        noteUI.position = CGPointMake(621.5, [self pitchToPosition:[note getPitch]]);

        linearMove = [SKAction moveToX:-89 duration:animationSpeed];
    }
    else if ([[note getDurationInString] isEqualToString:@"full"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"FullNote"]];
        noteUI.position = CGPointMake(684.5, [self pitchToPosition:[note getPitch]]);

        linearMove = [SKAction moveToX:-26 duration:animationSpeed];
    }
    else
    {
        NSLog(@"error in play occur!");
        return;
    }
    noteUI.zPosition = 1;
    [self addChild:noteUI];
    [note setUI:noteUI];
    
    linearMove.timingMode = SKActionTimingLinear;
    [noteUI runAction:linearMove completion:^{
        [noteUI removeFromParent];
    }];
}

-(void)playEighthNote:(NSString *)pitch
{
    SKTextureAtlas *notesAtlas = [SKTextureAtlas atlasNamed:@"notes"];
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"EighthNote"]];
    note.position = CGPointMake(574, [self pitchToPosition:pitch]);
    note.zPosition = 1;
    [self addChild:note];
    
    NSLog(@"Eighth Note Position x: %f; Position y:%f", note.position.x-note.size.width,note.position.y);
    NSLog(@"Eighth Note Width: %f; Height: %f", note.size.width, note.size.height);
    
    SKAction *linearMove = [SKAction moveToX:-136.5 duration:animationSpeed];
    linearMove.timingMode = SKActionTimingLinear;
    [note runAction:linearMove completion:^{
        [note removeFromParent];
    }];
}
-(void)playQuarterNote:(NSString *)pitch
{
    SKTextureAtlas *notesAtlas = [SKTextureAtlas atlasNamed:@"notes"];
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"QuarterNote"]];
    note.position = CGPointMake(590, [self pitchToPosition:pitch]);
    note.zPosition = 1;
    [self addChild:note];
    
    NSLog(@"Quarter Note Position x: %f; Position y:%f", note.position.x-note.size.width,note.position.y);
    NSLog(@"Quarter Note Width: %f; Height: %f", note.size.width, note.size.height);
    
    SKAction *linearMove = [SKAction moveToX:-120.5 duration:animationSpeed];
    linearMove.timingMode = SKActionTimingLinear;
    [note runAction:linearMove completion:^{
        [note removeFromParent];
    }];
}
-(void)playHalfNote:(NSString *)pitch
{
    SKTextureAtlas *notesAtlas = [SKTextureAtlas atlasNamed:@"notes"];
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"HalfNote"]];
    note.position = CGPointMake(621.5, [self pitchToPosition:pitch]);
    note.zPosition = 1;
    [self addChild:note];
    
    NSLog(@"Half Note Position x: %f; Position y:%f", note.position.x-note.size.width,note.position.y);
    NSLog(@"Half Note Width: %f; Height: %f", note.size.width, note.size.height);
    
    SKAction *linearMove = [SKAction moveToX:-89 duration:animationSpeed];
    linearMove.timingMode = SKActionTimingLinear;
    [note runAction:linearMove completion:^{
        [note removeFromParent];
    }];
}
-(void)playFullNote:(NSString *)pitch
{
    SKTextureAtlas *notesAtlas = [SKTextureAtlas atlasNamed:@"notes"];
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"FullNote"]];
    note.position = CGPointMake(684.5, [self pitchToPosition:pitch]);
    note.zPosition = 1;
    [self addChild:note];

    NSLog(@"Full Note Position x: %f; Position y:%f", note.position.x-note.size.width,note.position.y);
    NSLog(@"Full Note Width: %f; Height: %f", note.size.width, note.size.height);
    
    SKAction *linearMove = [SKAction moveToX:-26 duration:animationSpeed];
    linearMove.timingMode = SKActionTimingLinear;
    [note runAction:linearMove completion:^{
        [note removeFromParent];
    }];
}


#pragma mark IndicatorMovement
-(int)pitchToPosition:(NSString *)pitch
{
    if ([pitch isEqualToString:@"C5"])          return C5_y;
    else if ([pitch isEqualToString:@"B4"])     return B4_y;
    else if ([pitch isEqualToString:@"A#4"])    return ASharp4_y;
    else if ([pitch isEqualToString:@"A4"])     return A4_y;
    else if ([pitch isEqualToString:@"G#4"])    return GSharp4_y;
    else if ([pitch isEqualToString:@"G4"])     return G4_y;
    else if ([pitch isEqualToString:@"F#4"])    return FSharp4_y;
    else if ([pitch isEqualToString:@"F4"])     return F4_y;
    else if ([pitch isEqualToString:@"E4"])     return E4_y;
    else if ([pitch isEqualToString:@"D#4"])    return DSharp4_y;
    else if ([pitch isEqualToString:@"D4"])     return D4_y;
    else if ([pitch isEqualToString:@"C#4"])    return CSharp4_y;
    else if ([pitch isEqualToString:@"C4"])     return C4_y;
    else if ([pitch isEqualToString:@"B3"])     return B3_y;
    else if ([pitch isEqualToString:@"A#3"])    return ASharp3_y;
    else if ([pitch isEqualToString:@"A3"])     return A3_y;
    else if ([pitch isEqualToString:@"G#3"])    return GSharp3_y;
    else if ([pitch isEqualToString:@"G3"])     return G3_y;
    else if ([pitch isEqualToString:@"F#3"])    return FSharp3_y;
    else if ([pitch isEqualToString:@"F3"])     return F3_y;
    else if ([pitch isEqualToString:@"E3"])     return E3_y;
    else if ([pitch isEqualToString:@"D#3"])    return DSharp3_y;
    else if ([pitch isEqualToString:@"D3"])     return D3_y;
    else if ([pitch isEqualToString:@"C#3"])    return CSharp3_y;
    else if ([pitch isEqualToString:@"C3"])     return C3_y;
    else                                        return -8;
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

#pragma mark Play Sound
-(void)playSound:(NSString *)fileName
{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    audioPlayer = [[AVPlayer alloc] initWithURL:fileURL];
    [audioPlayer setVolume:0.1];
    [audioPlayer setRate:tempoRate/120];
    
    [audioPlayer play];
}

@end
