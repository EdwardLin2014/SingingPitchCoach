//
//  test_2_Fly_Me_To_The_Moon.m
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#import "test_2_Fly_Me_To_The_Moon.h"

@implementation test_2_Fly_Me_To_The_Moon

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
        userDefaults = [NSUserDefaults standardUserDefaults];
        _audioController = [[AudioController alloc] init:44100 FrameSize:(UInt32)[userDefaults integerForKey:@"kBufferSize"] OverLap:(Float32)[userDefaults integerForKey:@"percentageOfOverlap"]];
        [_audioController startIOUnit];
        
        /* Calculate Animation Speed */
        tempoRate = 7.5*60/[userDefaults integerForKey:@"tempo"];
        animationSpeed = tempoRate*710.5/458;
        
        /* Initialise Score Notes */
        score[0] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[1] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[2] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[3] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[4] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[5] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[6] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[7] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[8] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[9] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[10] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[11] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[12] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"thirdfourth" AndPlayDemo:YES];
        
        score[13] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[14] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[15] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[16] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[17] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[18] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[19] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[20] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[21] = [[Note alloc] initWithPitch:@"C#4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[22] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[23] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[24] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:YES];
        score[25] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"thirdfourth" AndPlayDemo:YES];
        
        score[26] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[27] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[28] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[29] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[30] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:NO];
        score[31] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[32] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[33] = [[Note alloc] initWithPitch:@"F4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[34] = [[Note alloc] initWithPitch:@"E4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:NO];
        score[35] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[36] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[37] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[38] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"thirdfourth" AndPlayDemo:NO];
        
        score[39] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:YES];
        score[40] = [[Note alloc] initWithPitch:@"C4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[41] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[42] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[43] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:NO];
        score[44] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[45] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[46] = [[Note alloc] initWithPitch:@"D4" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[47] = [[Note alloc] initWithPitch:@"C#4" AndTempoRate:tempoRate AndDuration:@"thirdeighth" AndPlayDemo:NO];
        score[48] = [[Note alloc] initWithPitch:@"A#3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[49] = [[Note alloc] initWithPitch:@"A3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[50] = [[Note alloc] initWithPitch:@"G3" AndTempoRate:tempoRate AndDuration:@"eighth" AndPlayDemo:NO];
        score[51] = [[Note alloc] initWithPitch:@"F3" AndTempoRate:tempoRate AndDuration:@"thirdfourth" AndPlayDemo:NO];
        
        NSString *soundFilePath;
        NSURL *fileURL;
        for(int i=0; i<28; i++)
        {
            switch (i)
            {
                case 0:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"01_Fly" ofType: @"wav"];       break;
                case 1:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"02_me" ofType: @"wav"];        break;
                case 2:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"03_to" ofType: @"wav"];        break;
                case 3:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"04_the" ofType: @"wav"];       break;
                case 4:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"05_moon" ofType: @"wav"];      break;
                case 5:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"06_and" ofType: @"wav"];       break;
                case 6:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"07_let" ofType: @"wav"];       break;
                case 7:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"08_me" ofType: @"wav"];        break;
                case 8:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"09_play" ofType: @"wav"];      break;
                case 9:         soundFilePath = [[NSBundle mainBundle] pathForResource:@"10_a" ofType: @"wav"];         break;
                case 10:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"11_mong" ofType: @"wav"];      break;
                case 11:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"12_the" ofType: @"wav"];       break;
                case 12:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"13_stars" ofType: @"wav"];     break;
                case 13:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"14_let" ofType: @"wav"];       break;
                case 14:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"15_me" ofType: @"wav"];        break;
                case 15:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"16_see" ofType: @"wav"];       break;
                case 16:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"17_what" ofType: @"wav"];      break;
                case 17:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"18_spring" ofType: @"wav"];    break;
                case 18:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"19_is" ofType: @"wav"];        break;
                case 19:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"20_like" ofType: @"wav"];      break;
                case 20:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"21_F_on" ofType: @"wav"];      break;
                case 21:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"22_ju" ofType: @"wav"];        break;
                case 22:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"23_pi" ofType: @"wav"];        break;
                case 23:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"24_ter" ofType: @"wav"];       break;
                case 24:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"25_and" ofType: @"wav"];       break;
                case 25:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"26_mars" ofType: @"wav"];      break;
                case 26:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"ready" ofType: @"wav"];        break;
                case 27:        soundFilePath = [[NSBundle mainBundle] pathForResource:@"go" ofType: @"wav"];           break;
            }
            
            fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
            audioPlayer[i] = [[AVPlayer alloc] initWithURL:fileURL];
            [audioPlayer[i] setVolume:0.1];
            [audioPlayer[i] setRate:tempoRate/120];
            
            // NOTE: MUST PAUSE! Otherwise they all start to play! But why!?
            [audioPlayer[i] pause];
        }

        /* Touch the Label to start */
        instructionLabel1 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel1.name = @"instructionLabel1";
        instructionLabel1.text = @"2_FlyMeToTheMoon";
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

        instructionLabel3 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel3.name = @"instructionLabel3";
        instructionLabel3.text = @"Exit?";
        instructionLabel3.scale = 0.5;
        instructionLabel3.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.2);
        instructionLabel3.fontColor = [SKColor yellowColor];
        [self addChild:instructionLabel3];
        
        SKAction *labelScaleAction = [SKAction scaleTo:1.0 duration:0.5];
        [instructionLabel1 runAction:labelScaleAction];
        [instructionLabel2 runAction:labelScaleAction];
        [instructionLabel3 runAction:labelScaleAction];
        
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
    
    SKAction *easeMove = [SKAction moveToY:[self midiToPosition:midi] duration:0.1f];
    easeMove.timingMode = SKActionTimingLinear;
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
    for (int i=0; i<52; i++)
        [score[i] resetPlayed];
    [self removeAllActions];
    indicator.hidden = YES;
    
    /* Your Score */
    performanceScorePoint = scorePoint / totalScorePoint * 100;
    
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
    if ([fileName isEqualToString:@"01_Fly"])           { [audioPlayer[0] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[0] play]; }
    else if ([fileName isEqualToString:@"02_me"])       { [audioPlayer[1] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[1] play]; }
    else if ([fileName isEqualToString:@"03_to"])       { [audioPlayer[2] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[2] play]; }
    else if ([fileName isEqualToString:@"04_the"])      { [audioPlayer[3] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[3] play]; }
    else if ([fileName isEqualToString:@"05_moon"])     { [audioPlayer[4] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[4] play]; }
    else if ([fileName isEqualToString:@"06_and"])      { [audioPlayer[5] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[5] play]; }
    else if ([fileName isEqualToString:@"07_let"])      { [audioPlayer[6] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[6] play]; }
    else if ([fileName isEqualToString:@"08_me"])       { [audioPlayer[7] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[7] play]; }
    else if ([fileName isEqualToString:@"09_play"])     { [audioPlayer[8] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[8] play]; }
    else if ([fileName isEqualToString:@"10_a"])        { [audioPlayer[9] seekToTime:CMTimeMake(0, 1)];  [audioPlayer[9] play]; }
    else if ([fileName isEqualToString:@"11_mong"])     { [audioPlayer[10] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[10] play]; }
    else if ([fileName isEqualToString:@"12_the"])      { [audioPlayer[11] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[11] play]; }
    else if ([fileName isEqualToString:@"13_stars"])    { [audioPlayer[12] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[12] play]; }
    else if ([fileName isEqualToString:@"14_let"])      { [audioPlayer[13] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[13] play]; }
    else if ([fileName isEqualToString:@"15_me"])       { [audioPlayer[14] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[14] play]; }
    else if ([fileName isEqualToString:@"16_see"])      { [audioPlayer[15] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[15] play]; }
    else if ([fileName isEqualToString:@"17_what"])     { [audioPlayer[16] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[16] play]; }
    else if ([fileName isEqualToString:@"18_spring"])   { [audioPlayer[17] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[17] play]; }
    else if ([fileName isEqualToString:@"19_is"])       { [audioPlayer[18] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[18] play]; }
    else if ([fileName isEqualToString:@"20_like"])     { [audioPlayer[19] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[19] play]; }
    else if ([fileName isEqualToString:@"21_F_on"])     { [audioPlayer[20] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[20] play]; }
    else if ([fileName isEqualToString:@"22_ju"])       { [audioPlayer[21] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[21] play]; }
    else if ([fileName isEqualToString:@"23_pi"])       { [audioPlayer[22] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[22] play]; }
    else if ([fileName isEqualToString:@"24_ter"])      { [audioPlayer[23] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[23] play]; }
    else if ([fileName isEqualToString:@"25_and"])      { [audioPlayer[24] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[24] play]; }
    else if ([fileName isEqualToString:@"26_mars"])     { [audioPlayer[25] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[25] play]; }
    else if ([fileName isEqualToString:@"ready"])       { [audioPlayer[26] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[26] play]; }
    else if ([fileName isEqualToString:@"go"])          { [audioPlayer[27] seekToTime:CMTimeMake(0, 1)]; [audioPlayer[27] play]; }
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
    else if ([[note getDurationInString] isEqualToString:@"thirdeighth"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"ThirdEighthNote"]];
        noteUI.position = CGPointMake(605.5, [self pitchToPosition:[note getPitch]]);
        
        linearMove = [SKAction moveToX:-105 duration:animationSpeed];
    }
    else if ([[note getDurationInString] isEqualToString:@"half"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"HalfNote"]];
        noteUI.position = CGPointMake(621.5, [self pitchToPosition:[note getPitch]]);
        
        linearMove = [SKAction moveToX:-89 duration:animationSpeed];
    }
    else if ([[note getDurationInString] isEqualToString:@"thirdfourth"])
    {
        noteUI = [SKSpriteNode spriteNodeWithTexture:[notesAtlas textureNamed:@"ThirdFourthNote"]];
        noteUI.position = CGPointMake(653, [self pitchToPosition:[note getPitch]]);
        
        linearMove = [SKAction moveToX:-57.5 duration:animationSpeed];
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
            [instructionLabel3 removeFromParent];
            
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
        
        if(n!=self && ([n.name isEqual: @"exitLabel"]||[n.name isEqual: @"instructionLabel3"]))
        {
            indicator.hidden = YES;
            
            /* stop the mic */
            //[pitchDetector TurnOffMicrophone];
            [_audioController stopIOUnit];
            _audioController = NULL;
            
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
    else if(notePos<26 && currentTime >= nextNoteTime)
    {
        if (notePos == 0)
            [goLabel removeFromParent];
        
        if (notePos == 25)
            nextNoteTime = currentTime + [score[notePos] getDurationInTime] + 5;
        else
            nextNoteTime = currentTime + [score[notePos] getDurationInTime];
        
        [self playNote:score[notePos] isLastNote:NO];
        
        notePos++;
    }
    else if(notePos == 26 && currentTime >= nextNoteTime)
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
    else if(notePos == 27 && currentTime >= nextNoteTime)
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
    else if(notePos<54 && currentTime >= nextNoteTime)
    {
        if (notePos == 28)
            [goLabel removeFromParent];
        
        nextNoteTime = currentTime + [score[notePos-2] getDurationInTime];
        
        if (notePos == 53)
            [self playNote:score[notePos-2] isLastNote:YES];
        else
            [self playNote:score[notePos-2] isLastNote:NO];
        
        notePos++;
    }
    /* ------------------------------------------ Play Score ------------------------------------------ End */
    
    /* ------------------------------------------ Play Demo ------------------------------------------ Begin */
    for (int i=0; i<26; i++)
    {
        if ([[score[i] getUI] intersectsNode:scoreLine] && ![score[i] isPlayed] && ![score[i] getUI].hidden)
        {
            [score[i] play];
            
            NSString *tmp;
            switch (i)
            {
                case 0:         tmp = @"01_Fly";                            break;
                case 1:         tmp = @"02_me";                             break;
                case 2:         tmp = @"03_to";                             break;
                case 3:         tmp = @"04_the";                            break;
                case 4:         tmp = @"05_moon";                           break;
                case 5:         tmp = @"06_and";                            break;
                case 6:         tmp = @"07_let";                            break;
                case 7:         tmp = @"08_me";                             break;
                case 8:         tmp = @"09_play";                           break;
                case 9:         tmp = @"10_a";                              break;
                case 10:        tmp = @"11_mong";                           break;
                case 11:        tmp = @"12_the";                            break;
                case 12:        tmp = @"13_stars";                          break;
                case 13:        tmp = @"14_let";                            break;
                case 14:        tmp = @"15_me";                             break;
                case 15:        tmp = @"16_see";                            break;
                case 16:        tmp = @"17_what";                           break;
                case 17:        tmp = @"18_spring";                         break;
                case 18:        tmp = @"19_is";                             break;
                case 19:        tmp = @"20_like";                           break;
                case 20:        tmp = @"21_F_on";                           break;
                case 21:        tmp = @"22_ju";                             break;
                case 22:        tmp = @"23_pi";                             break;
                case 23:        tmp = @"24_ter";                            break;
                case 24:        tmp = @"25_and";                            break;
                case 25:        tmp = @"26_mars";                           break;
                default:        NSLog(@"cannot find the duration?");        break;
            }
            
//            NSLog(@"sound clip chosen: %@", tmp);
            
            [self playSound:tmp];
        }
    }
    if ([[score[26] getUI] intersectsNode:scoreLine] && ![score[26] isPlayed] && ![score[26] getUI].hidden)
    {
        [score[26] play];
        [self playSound:@"01_Fly"];
    }
    if ([[score[27] getUI] intersectsNode:scoreLine] && ![score[27] isPlayed] && ![score[27] getUI].hidden)
    {
        [score[27] play];
        [self playSound:@"02_me"];
    }
    if ([[score[39] getUI] intersectsNode:scoreLine] && ![score[39] isPlayed] && ![score[39] getUI].hidden)
    {
        [score[39] play];
        [self playSound:@"14_let"];
    }
    if ([[score[40] getUI] intersectsNode:scoreLine] && ![score[40] isPlayed] && ![score[40] getUI].hidden)
    {
        [score[40] play];
        [self playSound:@"15_me"];
    }
    /* ------------------------------------------ Play Demo ------------------------------------------ End */
    
    /* ------------------------------------------ Estimate your Pitch ------------------------------------------ Begin */
    [self moveIndicatorByMIDI:(int)round((double)[_audioController CurrentMIDI])];
    /* ------------------------------------------ Estimate your Pitch ------------------------------------------ End */
    
    /* ------------------------------------------ Calculate your Score ------------------------------------------ Begin */
    for (int i=26; i<52; i++)
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
            }
        }
    }
    /* ------------------------------------------ Calculate your Score ------------------------------------------ End */
    
}
@end
