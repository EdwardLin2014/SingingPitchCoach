//
//  test_1_4096_50.m
//  SingingPitchCoach
//
//  Created by Edward on 14/1/14.
//  Copyright (c) 2014 Edward. All rights reserved.
//
#import "test_1_4096_50.h"

@implementation test_1_4096_50

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        userDefaults = [NSUserDefaults standardUserDefaults];

        [userDefaults setInteger:4096 forKey:@"kBufferSize"];
        [userDefaults setInteger:50 forKey:@"percentageOfOverlap"];
        [userDefaults synchronize];
        
        /* Add background - Begin */
        self.backgroundColor = [SKColor whiteColor];
        
        SKTextureAtlas *backgroundAtlas = [SKTextureAtlas atlasNamed:@"background"];
        
        SKSpriteNode *score = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5Score"]];
        score.position = CGPointMake(315, (CGRectGetMidY(self.frame)-10));
        score.zPosition = 0;
        [self addChild:score];
        
        SKSpriteNode *pianoRoll = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"C3C5PianoRoll"]];
        pianoRoll.position = CGPointMake(43, (CGRectGetMidY(self.frame)-10));
        pianoRoll.zPosition = 3;
        [self addChild:pianoRoll];
        
        indicator = [SKSpriteNode spriteNodeWithTexture:[backgroundAtlas textureNamed:@"indicator"]];
        indicator.position = CGPointMake(15, -8);
        indicator.zPosition = 4;
        indicator.hidden = NO;
        [self addChild:indicator];
        /* Add background - End */
        
        /* start the mic */
        _audioController = [[AudioController alloc] init:44100 FrameSize:4096];
        _bufferManager = [_audioController getBufferManagerInstance];
        _l_fftData = (Float32*) calloc(4096, sizeof(Float32));
        _l_cepstrumData = (Float32*) calloc(4096, sizeof(Float32));
        _l_fftcepstrumData = (Float32*) calloc(4096, sizeof(Float32));
        _Hz120 = floor(120*(float)4096/(float)44100);
        _Hz530 = floor(530*(float)4096/(float)44100);
        /* Turn on the microphone */
        [_audioController startIOUnit];
        
        /* Touch the Label to exit */
        instructionLabel1 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel1.name = @"instructionLabel1";
        instructionLabel1.text = @"1_4096_50";
        instructionLabel1.scale = 0.5;
        instructionLabel1.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.6);
        instructionLabel1.fontColor = [SKColor yellowColor];
        [self addChild:instructionLabel1];
        
        instructionLabel2 = [[SKLabelNode alloc] initWithFontNamed:@"Futura-CondensedMedium"];
        instructionLabel2.name = @"instructionLabel2";
        instructionLabel2.text = @"Touch Screen to Exit";
        instructionLabel2.scale = 0.5;
        instructionLabel2.position = CGPointMake(self.frame.size.width/2+33, self.frame.size.height*0.4);
        instructionLabel2.fontColor = [SKColor yellowColor];
        [self addChild:instructionLabel2];
        
        SKAction *labelScaleAction = [SKAction scaleTo:1.0 duration:0.5];
        
        [instructionLabel1 runAction:labelScaleAction];
        [instructionLabel2 runAction:labelScaleAction];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    indicator.hidden = YES;
 
    /* stop the mic */
    //[pitchDetector TurnOffMicrophone];
    [_audioController stopIOUnit];
    _audioController = NULL;
    _bufferManager = NULL;
    
    TestingScene* home = [[TestingScene alloc] initWithSize:CGSizeMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [self.scene.view presentScene:home transition:[SKTransition doorsCloseHorizontalWithDuration:1.0]];
}

-(void)update:(CFTimeInterval)currentTime
{
    if (_bufferManager != NULL)
    {
        if(_bufferManager->HasNewFFTData())
        {
            [_audioController GetFFTOutput:_l_fftData];
            _bufferManager->GetCepstrumOutput(_l_fftData, _l_cepstrumData);
            _bufferManager->GetFFTCepstrumOutput(_l_fftData, _l_cepstrumData, _l_fftcepstrumData);
            
            _maxAmp = -INFINITY;
            _bin = _Hz120;
            for (int i=_Hz120; i<=_Hz530; i++)
            {
                _curAmp = _l_fftcepstrumData[i];
                if (_curAmp > _maxAmp)
                {
                    _maxAmp = _curAmp;
                    _bin = i;
                }
            }
            
            _frequency = _bin*((float)44100/(float)4096);
            _midiNum = [_audioController freqToMIDI:_frequency];
            _pitch = [_audioController midiToPitch:_midiNum];
            //NSLog(@"Current: %.12f %d %.12f %@", _frequency, _bin, _midiNum, _pitch);
            
            [self moveIndicatorByMIDI:(int)round((double)_midiNum)];
        }
    }
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
