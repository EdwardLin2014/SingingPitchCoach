//
//  test_3_Arpeggios_7th.m
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//

#import "test_3_Arpeggios_7th.h"
#import "TestingScene.h"

@implementation test_3_Arpeggios_7th

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Add background - Begin */
        self.backgroundColor = [SKColor whiteColor];
        
        SKTextureAtlas *backgroundAtlas = [SKTextureAtlas atlasNamed:@"background"];
        
        SKSpriteNode *scoreBK = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5Score"]];
        scoreBK.position = CGPointMake(315, (CGRectGetMidY(self.frame)-10));
        scoreBK.zPosition = 0;
        [self addChild:scoreBK];
        
        scoreLine = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"ScoreLine"]];
        scoreLine.position = CGPointMake(84, (CGRectGetMidY(self.frame)-10));
        scoreLine.zPosition = 1;
        [self addChild:scoreLine];
        
        SKSpriteNode *pianoRoll = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5PianoRoll"]];
        pianoRoll.position = CGPointMake(43, (CGRectGetMidY(self.frame)-10));
        pianoRoll.zPosition = 3;
        [self addChild:pianoRoll];
        
        indicator = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"indicator"]];
        indicator.position = CGPointMake(15, -8);
        indicator.zPosition = 4;
        [self addChild:indicator];
        /* Add background - End */
        
        /* start the mic */
        pitchDetector = [PitchDetector sharedDetector];
        [pitchDetector TurnOnMicrophone_test_3_Arpeggios_7th:self];
        
        /* Calculate Animation Speed */
        userDefaults = [NSUserDefaults standardUserDefaults];
        tempoRate = 7.5*60/[userDefaults integerForKey:@"tempo"];
        animationSpeed = tempoRate*710.5/458;
        
        /* Initialise Score Notes */
        score[0] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[1] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[2] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[3] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[4] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        
        score[5] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[6] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[7] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[8] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[9] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        
        score[10] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:YES];
        score[11] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[12] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[13] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[14] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        
        score[15] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[16] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[17] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[18] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        score[19] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"quarter" AndPlayDemo:NO];
        
        /* Touch the Label to start */
        instructionLabel1 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel1.name = @"instructionLabel1";
        instructionLabel1.text = @"3_Arpeggios_7th";
        instructionLabel1.scale = 0.5;
        instructionLabel1.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.6);
        instructionLabel1.fontColor = [SKColor yellowColor];
        [self addChild:instructionLabel1];
        
        instructionLabel2 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel2.name = @"instructionLabel2";
        instructionLabel2.text = @"Start?";
        instructionLabel2.scale = 0.5;
        instructionLabel2.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.4);
        instructionLabel2.fontColor = [SKColor yellowColor];
        [self addChild:instructionLabel2];
        
        SKAction *labelScaleAction = [SKAction scaleTo:1.0 duration:0.5];
        
        [instructionLabel1 runAction:labelScaleAction];
        [instructionLabel2 runAction:labelScaleAction];
        
        performanceScoreLabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        performanceScoreLabel.name = @"performanceScore";
        performanceScoreLabel.text = @"Score: 0.00%";
        performanceScoreLabel.fontSize = 25;
        performanceScoreLabel.position = CGPointMake(140, CGRectGetMaxY(self.frame)-20);
        performanceScoreLabel.fontColor = [SKColor redColor];
        [self addChild:performanceScoreLabel];

        filledCircle = [[SKShapeNode alloc]init];
        UIBezierPath *circlePath = [[UIBezierPath alloc] init];
        [circlePath moveToPoint:CGPointMake(0.0, 0.0)];
        [circlePath addArcWithCenter:CGPointMake(0.0, 0.0) radius:6.0 startAngle:0.0 endAngle:(M_PI*2.0) clockwise:YES];
        filledCircle.path = circlePath.CGPath;
        filledCircle.strokeColor = [SKColor clearColor];
        filledCircle.fillColor = [SKColor redColor];
        filledCircle.hidden = YES;
        filledCircle.zPosition = 3;
        [self addChild:filledCircle];
        
        gameOver = YES;
    }
    
    return self;
}

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
-(void)moveIndicatorByMIDI:(int)midi
{
    if (indicator.hidden)
        return;
    
    SKAction *easeMove = [SKAction moveToY:[self midiToPosition:midi] duration:0.2f];
    easeMove.timingMode = SKActionTimingEaseInEaseOut;
    [indicator runAction:easeMove];
}

- (void)startTheGame
{
    indicator.hidden = NO;
    
    gameOver = NO;
    notePos = -2;
    nextNoteTime = 0;
    
    scorePoint = 0;
    totalScorePoint = 0;
    performanceScorePoint = 0;
}

- (void)endTheGame
{
    if (gameOver)
        return;
    
    gameOver = YES;
    for (int i=0; i<20; i++)
        [score[i] resetPlayed];
    [self removeAllActions];
    indicator.hidden = YES;
    filledCircle.hidden = YES;
    
    SKLabelNode *scorePointlabel;
    scorePointlabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondenseMedium"];
    scorePointlabel.name = @"scorePointLabel";
    scorePointlabel.text = [NSString stringWithFormat:@"Performance Score: %.2f%%", performanceScorePoint];
    scorePointlabel.scale = 0.1;
    scorePointlabel.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.6);
    scorePointlabel.fontColor = [SKColor yellowColor];
    [self addChild:scorePointlabel];
    
    SKLabelNode *restartLabel;
    restartLabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
    restartLabel.name = @"restartLabel";
    restartLabel.text = @"Train Again?";
    restartLabel.scale = 0.5;
    restartLabel.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.4);
    restartLabel.fontColor = [SKColor yellowColor];
    [self addChild:restartLabel];
    
    SKLabelNode *exitLabel;
    exitLabel = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
    exitLabel.name = @"exitLabel";
    exitLabel.text = @"Exit?";
    exitLabel.scale = 0.5;
    exitLabel.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.2);
    exitLabel.fontColor = [SKColor yellowColor];
    [self addChild:exitLabel];
    
    
    SKAction *labelScaleAction = [SKAction scaleTo:1.0 duration:0.5];
    
    [scorePointlabel runAction:labelScaleAction];
    [restartLabel runAction:labelScaleAction];
    [exitLabel runAction:labelScaleAction];
}

-(void)playSound:(NSString *)fileName
{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    audioPlayer = [[AVPlayer alloc] initWithURL:fileURL];
    [audioPlayer setVolume:0.1];
    [audioPlayer setRate:tempoRate/120];
    
    [audioPlayer play];
}

-(void)playNote:(Note *)note isLastNote:(bool)isLastNote;
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
    noteUI.zPosition = 2;
    [self addChild:noteUI];
    [note setUI:noteUI];
    
    linearMove.timingMode = SKActionTimingLinear;
    [noteUI runAction:linearMove completion:^{
        [noteUI removeFromParent];
        noteUI.hidden = YES;
        if (isLastNote)
            [self endTheGame];
    }];
}

- (bool)isScorePoint:(NSString *)pitch
{
    if (indicator.hidden)
        return false;
    
    if ([pitch isEqualToString:@"C5"] && (indicator.position.y > 288.5 && indicator.position.y <= 300.5))           return true;
    else if ([pitch isEqualToString:@"B4"] && (indicator.position.y > 276.5 && indicator.position.y <= 288.5))      return true;
    else if ([pitch isEqualToString:@"A#4"] && (indicator.position.y > 264.5 && indicator.position.y <= 276.5))     return true;
    else if ([pitch isEqualToString:@"A4"] && (indicator.position.y > 252.5 && indicator.position.y <= 264.5))      return true;
    else if ([pitch isEqualToString:@"G#4"] && (indicator.position.y > 240.5 && indicator.position.y <= 252.5))     return true;
    else if ([pitch isEqualToString:@"G4"] && (indicator.position.y > 228.5 && indicator.position.y <= 240.5))      return true;
    else if ([pitch isEqualToString:@"F#4"] && (indicator.position.y > 216.5 && indicator.position.y <= 228.5))     return true;
    else if ([pitch isEqualToString:@"F4"] && (indicator.position.y > 204.5 && indicator.position.y <= 216.5))      return true;
    else if ([pitch isEqualToString:@"E4"] && (indicator.position.y > 192.5 && indicator.position.y <= 204.5))      return true;
    else if ([pitch isEqualToString:@"D#4"] && (indicator.position.y > 180.5 && indicator.position.y <= 192.5))     return true;
    else if ([pitch isEqualToString:@"D4"] && (indicator.position.y > 168.5 && indicator.position.y <= 180.5))      return true;
    else if ([pitch isEqualToString:@"C#4"] && (indicator.position.y > 156.5 && indicator.position.y <= 168.5))     return true;
    else if ([pitch isEqualToString:@"C4"] && (indicator.position.y > 144.5 && indicator.position.y <= 156.5))      return true;
    else if ([pitch isEqualToString:@"B3"] && (indicator.position.y > 132.5 && indicator.position.y <= 144.5))      return true;
    else if ([pitch isEqualToString:@"A#3"] && (indicator.position.y > 120.5 && indicator.position.y <= 132.5))      return true;
    else if ([pitch isEqualToString:@"A3"] && (indicator.position.y  > 108.5 && indicator.position.y <= 120.5))     return true;
    else if ([pitch isEqualToString:@"G#3"] && (indicator.position.y > 96.5 && indicator.position.y <= 108.5))      return true;
    else if ([pitch isEqualToString:@"G3"] && (indicator.position.y > 84.5 && indicator.position.y <= 96.5))        return true;
    else if ([pitch isEqualToString:@"F#3"] && (indicator.position.y > 73.5 && indicator.position.y <= 84.5))       return true;
    else if ([pitch isEqualToString:@"F3"] && (indicator.position.y > 60.5 && indicator.position.y <= 73.5))        return true;
    else if ([pitch isEqualToString:@"E3"] && (indicator.position.y > 48.5 && indicator.position.y <= 60.5))        return true;
    else if ([pitch isEqualToString:@"D#3"] && (indicator.position.y >36.5 && indicator.position.y <= 48.5))        return true;
    else if ([pitch isEqualToString:@"D3"] && (indicator.position.y > 24.5 && indicator.position.y <= 36.5))        return true;
    else if ([pitch isEqualToString:@"C#3"] && (indicator.position.y > 12 && indicator.position.y <= 24.5))         return true;
    else if ([pitch isEqualToString:@"C3"] && (indicator.position.y >= 0 && indicator.position.y <=12))             return true;
    else                                                                                                            return false;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        SKNode *n = [self nodeAtPoint:[touch locationInNode:self]];
        if(n!=self && [n.name isEqual: @"instructionLabel2"])
        {
            [instructionLabel1 removeFromParent];
            [instructionLabel2 removeFromParent];
            
            [self startTheGame];
        }
        
        if(n!=self && [n.name isEqual: @"restartLabel"])
        {
            [[self childNodeWithName:@"scorePointLabel"] removeFromParent];
            [[self childNodeWithName:@"restartLabel"] removeFromParent];
            [[self childNodeWithName:@"exitLabel"] removeFromParent];
            [self startTheGame];
            return;
        }
        
        if(n!=self && [n.name isEqual: @"exitLabel"])
        {
            indicator.hidden = YES;
            
            /* stop the mic */
            [pitchDetector TurnOffMicrophone];
            
            TestingScene* home = [[TestingScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
            [self.scene.view presentScene:home transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    if (gameOver)
        return;
    
    /* ------------------------------------------ Play Score ------------------------------------------ Begin */
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
        
        notePos++;
    }
    else if(notePos<10 && currentTime >= nextNoteTime)
    {
        if (notePos == 0)
            [goLabel removeFromParent];
        
        if (notePos == 9)
            nextNoteTime = currentTime + [score[notePos] getDurationInTime] + 5;
        else
            nextNoteTime = currentTime + [score[notePos] getDurationInTime];
        
        [self playNote:score[notePos] isLastNote:NO];
        
        notePos++;
    }
    else if(notePos == 10 && currentTime >= nextNoteTime)
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
        
        notePos++;
    }
    else if(notePos == 11 && currentTime >= nextNoteTime)
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
        
        notePos++;
    }
    else if(notePos<22 && currentTime >= nextNoteTime)
    {
        if (notePos == 12)
            [goLabel removeFromParent];
        
        nextNoteTime = currentTime + [score[notePos-2] getDurationInTime];
        
        if (notePos == 21)
            [self playNote:score[notePos-2] isLastNote:YES];
        else
            [self playNote:score[notePos-2] isLastNote:NO];
        
        notePos++;
    }
    /* ------------------------------------------ Play Score ------------------------------------------ End */
    
    /* ------------------------------------------ Play Demo ------------------------------------------ Begin */
    for (int i=0; i<10; i++)
    {
        if ([[score[i] getUI] intersectsNode:scoreLine] && ![score[i] isPlayed] && ![score[i] getUI].hidden)
        {
            [score[i] play];
            
            NSString *tmp = [score[i] getPitch];
            if ([[score[i] getDurationInString] isEqualToString:@"eighth"])
                tmp = [tmp stringByAppendingString:@"_8"];
            else if ([[score[i] getDurationInString] isEqualToString:@"quarter"])
                tmp = [tmp stringByAppendingString:@"_4"];
            else if ([[score[i] getDurationInString] isEqualToString:@"half"])
                tmp = [tmp stringByAppendingString:@"_2"];
            else if ([[score[i] getDurationInString] isEqualToString:@"full"])
                tmp = [tmp stringByAppendingString:@"_1"];
            else
            {
                NSLog(@"cannot find the duration?");
                continue;
            }
            
            [self playSound:tmp];
        }
    }
    if ([[score[10] getUI] intersectsNode:scoreLine] && ![score[10] isPlayed] && ![score[10] getUI].hidden)
    {
        [score[10] play];
        
        NSString *tmp = [score[10] getPitch];
        if ([[score[10] getDurationInString] isEqualToString:@"eighth"])
            tmp = [tmp stringByAppendingString:@"_8"];
        else if ([[score[10] getDurationInString] isEqualToString:@"quarter"])
            tmp = [tmp stringByAppendingString:@"_4"];
        else if ([[score[10] getDurationInString] isEqualToString:@"half"])
            tmp = [tmp stringByAppendingString:@"_2"];
        else if ([[score[10] getDurationInString] isEqualToString:@"full"])
            tmp = [tmp stringByAppendingString:@"_1"];
        else
            NSLog(@"cannot find the duration?");
        
        [self playSound:tmp];
    }
    /* ------------------------------------------ Play Demo ------------------------------------------ End */
    
    /* ------------------------------------------ Calculate your Score ------------------------------------------ Begin */
    for (int i=10; i<20; i++)
    {
        if ([[score[i] getUI] intersectsNode:scoreLine] && ![score[i] getUI].hidden)
        {
            totalScorePoint++;
            if ([self isScorePoint:[score[i] getPitch]])
            {
                scorePoint++;
                
                SKAction *blink = [SKAction sequence:@[[SKAction fadeOutWithDuration:0.1],[SKAction fadeInWithDuration:0.1]]];
                //                SKAction *blink = [SKAction sequence:@[[SKAction fadeAlphaTo:0 duration:0.1],[SKAction fadeAlphaTo:1 duration:0.1]]];
                SKAction *blinkForTime = [SKAction repeatAction:blink count:5];
                [[score[i] getUI] runAction:blinkForTime];
                
                filledCircle.hidden = NO;
                filledCircle.fillColor = [SKColor blueColor];
                filledCircle.position = CGPointMake(85, [self pitchToPosition: [score[i] getPitch]]);
            }
            else
            {
                filledCircle.hidden = NO;
                filledCircle.fillColor = [SKColor redColor];
                filledCircle.position = CGPointMake(85, [self pitchToPosition: [score[i] getPitch]]);
            }
        }
    }
    
    /* Your Score */
    performanceScorePoint = scorePoint / totalScorePoint * 100;

    if (isnan(performanceScorePoint))
        performanceScoreLabel.text = @"Score: 0.00%";
    else
        performanceScoreLabel.text = [NSString stringWithFormat:@"Score: %.2f%%", performanceScorePoint];
    /* ------------------------------------------ Calculate your Score ------------------------------------------ End */
}

@end

