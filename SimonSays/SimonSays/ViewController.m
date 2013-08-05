//
//  ViewController.m
//  SimonSays
//
//  Created by alexchoi1 on 8/1/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "ColorPanelView.h"
#import "WinView.h"
#import "LoseView.h"
#import "HighScoreViewController.h"


@interface ViewController ()
{
    NSMutableArray * animateArray;
    NSMutableArray * userTouchedArray;
    
    NSMutableArray * highScoresArray;
    NSMutableDictionary * highScoresDictionary;
    
    int arrayIndex; //helps VC keep track of which colorview it is animating
    BOOL usersTurn;
    int difficultyLevel;
    int score;
    BOOL winLoseScreen;
    
    LoseView * loseView;
    WinView * winView;
    
    SystemSoundID sound1;
    SystemSoundID sound2;
    SystemSoundID sound3;
    SystemSoundID sound4;
    SystemSoundID sound5;
    SystemSoundID sound6;
    
    HighScoreViewController * highScoreViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    arrayIndex = 0;
    [self stop];
    difficultyLevel = 3;
    score = 0;
    winLoseScreen = NO;
    highScoresArray = [NSMutableArray arrayWithCapacity:10];
    highScoresDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    winView = [[WinView alloc] initWithFrame:CGRectMake(1, 1, self.view.frame.size.width, self.view.frame.size.height)];
    loseView = [[LoseView alloc] initWithFrame:CGRectMake(1, 1, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(newGame) name:@"NewGame" object:nil];
    
    NSString * soundPath1 = [[NSBundle mainBundle] pathForResource:@"SREC1" ofType:@"wav"];
    NSURL *soundUrl1 = [NSURL fileURLWithPath:soundPath1];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl1), &sound1);
    
    NSString * soundPath2 = [[NSBundle mainBundle] pathForResource:@"LDKCRW3" ofType:@"wav"];
    NSURL *soundUrl2 = [NSURL fileURLWithPath:soundPath2];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl2), &sound2);
    
    NSString * soundPath3 = [[NSBundle mainBundle] pathForResource:@"L1" ofType:@"wav"];
    NSURL *soundUrl3 = [NSURL fileURLWithPath:soundPath3];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl3), &sound3);
    
    NSString * soundPath4 = [[NSBundle mainBundle] pathForResource:@"TChant1" ofType:@"wav"];
    NSURL *soundUrl4 = [NSURL fileURLWithPath:soundPath4];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl4), &sound4);
    
    NSString * soundPath5 = [[NSBundle mainBundle] pathForResource:@"Populette1" ofType:@"wav"];
    NSURL *soundUrl5 = [NSURL fileURLWithPath:soundPath5];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl5), &sound5);
    
    NSString * soundPath6 = [[NSBundle mainBundle] pathForResource:@"GChant1" ofType:@"wav"];
    NSURL *soundUrl6 = [NSURL fileURLWithPath:soundPath6];
    AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl6), &sound6);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         ColorPanelView * colorPanel = obj;
         if ([colorPanel isKindOfClass:[ColorPanelView class]])
         {
             colorPanel.delegate = self;
         }
     }];
    
    [self newGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) sendGoNotification
{
    NSNumber * arrayItem = [animateArray objectAtIndex:arrayIndex];
    [self activateColorView:arrayItem];
    [self stop];

}

-(void) activateColorView: (NSNumber *) viewNumber
{
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"go" object:viewNumber ];
    [self playSound:viewNumber];
}

-(void) playSound: (NSNumber *) soundNumber
{
    int soundInt = soundNumber.intValue;
    
    switch (soundInt) {
        case 1:
            AudioServicesPlaySystemSound(sound1);
            break;
        case 2:
            AudioServicesPlaySystemSound(sound2);
            break;
        case 3:
            AudioServicesPlaySystemSound(sound3);
            break;
        case 4:
            AudioServicesPlaySystemSound(sound4);
            break;
        case 5:
            AudioServicesPlaySystemSound(sound5);
            break;
        case 6:
            AudioServicesPlaySystemSound(sound6);
            break;
            
        default:
            break;
    }
    
    NSLog(@"sound %@ played", soundNumber);
    
}

-(void) win
{
    score += difficultyLevel*10;
    
    if (difficultyLevel < self.view.subviews.count)
    {
        difficultyLevel ++;
    }
    winView.score = score;
        winLoseScreen = YES;
    [self.view addSubview:winView];
    
    
    [self stop];
    
    NSLog(@"win");
}

-(void) lose
{
    NSLog(@"lose");
    
    if (!highScoreViewController)
    {
        highScoreViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HighScoreViewController"];
    }
    
    highScoreViewController.score = score;
    score = 0;
        [self stop];
    winLoseScreen = YES;
    [UIView animateWithDuration:1 animations:^{
        [self.view addSubview:highScoreViewController.view];
    }];
}

-(void) newGame
{
    
    [self stop];
        winLoseScreen = NO;
    NSLog(@"NEW GAME");
    arrayIndex = 0;
    [self makeNewArray];
    [self sendGoNotification];
}
-(void) makeNewArray
{
    animateArray = [NSMutableArray arrayWithCapacity:difficultyLevel];
    int colorPanelCount=0;
    
    for (int i=0; i< self.view.subviews.count; i++) {
        if ( [[self.view.subviews objectAtIndex:i] isKindOfClass:[ColorPanelView class]])
        {
            colorPanelCount ++;
        }
    }
    
    for (int i = 0; i<  difficultyLevel   ; i++)
    {
        NSNumber * numberForArray = [NSNumber numberWithInt: (arc4random()%colorPanelCount)+1 ];
        [animateArray addObject:numberForArray];
    }
    userTouchedArray = [NSMutableArray arrayWithCapacity:animateArray.count];
    NSLog(@"%@",animateArray);
}

-(void) stop
{
    usersTurn = NO;
    self.view.layer.borderColor = [UIColor redColor].CGColor;
    self.view.layer.borderWidth = 3;
    
}

-(void) go
{
    usersTurn = YES;
    self.view.layer.borderColor = [UIColor greenColor].CGColor;
    self.view.layer.borderWidth = 3;
}


#pragma mark ColorPanelViewProtocol

-(void) panelFinished: (int) tag
{
    
    
    if (!usersTurn)
    {
        arrayIndex ++;
        NSLog(@"panel finished, not users turn");
    }
    
    
    
    if (arrayIndex < animateArray.count)
    {
        [self sendGoNotification];
        NSLog(@"panel finished sending next go notification");
    }
    else
    {
        NSLog(@"switching to users turn");
        if (!winLoseScreen)
        {
            [self go];
        }
       
    }
    
}


-(void) touchedView: (int) tag
{
    NSLog(@"touch");
    NSNumber * tagNum = [NSNumber numberWithInt:tag];
    
    if (usersTurn) ///touching views only works on the user's turn
    {
        
        NSLog(@"users turn, touch %i",tag);
        [userTouchedArray addObject: [NSNumber numberWithInt:tag]];
        [self activateColorView:tagNum];
        
        
        if (userTouchedArray.count > animateArray.count-1)
            //holds off win-lose evaluation until last touch
            
        {
            
            if ([userTouchedArray isEqualToArray:animateArray])
            {
                NSLog(@"touched view win");
                [self win];
            }
            else
            {
                NSLog(@"touched view lose");
                [self lose];
            }
        }
    }
    else
    {
        NSLog(@" touched, but not users turn yet");
    }
}
@end
