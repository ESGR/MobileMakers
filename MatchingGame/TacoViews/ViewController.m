//
//  ViewController.m
//  TacoViews
//
//  Created by alexchoi1 on 7/18/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "WinView.h"


@interface ViewController ()
{
    
    BOOL storeNotMatch;
    MYView * firstPick;
    MYView * secondPick;
    int successfulMatchCount;
    int missedScore;
    
    int score;
    int totalScore;
    
    WinView * winView;
    
    UILabel * totalScoreLabel;
    UILabel * roundScoreLabel;
    UILabel * missedScoreLabel;
    UILabel * elapsedTimeLabel;
    
    NSTimer * gameTimer;
    int time;
    int totalTime;
     UIButton * resetButton;
  
    
}




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    storeNotMatch = YES;
 
    
    successfulMatchCount = 0;
    totalScore = 0;
    
    ///win screen
    winView =  [[WinView alloc] initWithFrame:CGRectMake(0, 0, 320, 321)];
    winView.delegate = self;
    
    roundScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 321, 150, 30)];
    roundScoreLabel.text = @" Matches:    ";
    [self.view addSubview:roundScoreLabel];
    
    missedScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 361, 150, 30)];
    missedScoreLabel.text = @" Misses:    ";
    [self.view addSubview:missedScoreLabel];
    
    totalScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(161, 321, 150, 30)];
    totalScoreLabel.text = @" Score:    ";
    [self.view addSubview:totalScoreLabel];
    
    elapsedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(161, 361, 150, 30)];
    elapsedTimeLabel.text = @" Time:    ";
    [self.view addSubview:elapsedTimeLabel];
    
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(incrementTime) userInfo:nil repeats:YES];
    
    resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetButton.frame = CGRectMake(0, 401, 150, 30);
   
    [resetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [resetButton addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    [self.view addSubview:resetButton];
    
    ///sets all the subviews as having delegate root maincontroller
    for (UIView * subview in self.view.subviews)
    {
        if ( [subview isKindOfClass:[MYView class]])
            
        {
            MYView * myView = (MYView *)subview;
            myView.delegate = self;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) markMatch: (MYView *) first Second:(MYView *) second
{
    
    // firstPick.backgroundColor = [UIColor greenColor];
    [first increaseAlpha];
    
    //secondPick.backgroundColor = [UIColor greenColor];
    [second increaseAlpha];
    
    first.isWon = YES;
    second.isWon = YES;
    
    successfulMatchCount ++;
    
    
    roundScoreLabel.text = [NSString stringWithFormat:@" Matches: %i    ",successfulMatchCount];
    totalScoreLabel.text = [NSString stringWithFormat:@" Score: %i    ",totalScore];
    [self didWin];
    
}

-(void) failedPick: (MYView *) first Second: (MYView *) second
{
    if (!first.isWon && !second.isWon)
    {
    first.backgroundColor = [UIColor redColor];
    second.backgroundColor = [UIColor redColor];
    
    missedScore  ++;
    
    missedScoreLabel.text = [NSString stringWithFormat:@" Misses: %i    ",missedScore];
    
    NSArray * views = @[first, second];
    NSTimer * failTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector (resetLastTwoPicks:) userInfo:views repeats:NO];
    }
    
}

- (void) resetLastTwoPicks: (NSTimer *) timerInfo
{
    
    NSArray * views = [timerInfo userInfo];
    MYView * first = [views objectAtIndex:0];
    MYView * second = [views objectAtIndex:1];
    if (!first.isWon && !second.isWon)
    {
        first.backgroundColor = [UIColor whiteColor];
        second.backgroundColor = [UIColor whiteColor];
    }
}

-(void) didWin
{
    
    if (successfulMatchCount > 7)
    {
        [gameTimer invalidate];
        ///goes to win screen
        
        score = (successfulMatchCount - missedScore)/(time/60+1);
        totalScore = totalScore + score;
        
        winView.matches = successfulMatchCount;
        winView.misses = missedScore;
        winView.time = time;
        winView.totalTime = totalTime;
        winView.score = score;
        winView.totalScore = totalScore;
        
     
        
        
        
        [self updateScores];
        [winView updateLabels];
        [self.view addSubview:winView];
    }
}



-(void) resetGame
{
    successfulMatchCount = 0;
    missedScore = 0;
    time = 0;
    score = 0;
    
    if (gameTimer)
    {
        [gameTimer invalidate];
    }
    
    [self updateScores];
    
    
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(incrementTime) userInfo:nil repeats:YES];
    
    for (UIView * subview in self.view.subviews)
    {
        if ([subview isKindOfClass:[MYView class]])
            
        {
            MYView * myView = (MYView *)subview;
            myView.backgroundColor = [UIColor whiteColor];
            [myView decreaseAlpha];
            myView.isWon = NO;
        }
    }
    
}



-(void) incrementTime
{
    time ++;
    totalTime++;
    elapsedTimeLabel.text = [NSString stringWithFormat:@" Time: %i   ",time];
    
}

-(void) switchBoolean
{
    
    
    if (storeNotMatch)
    {
        
        storeNotMatch = NO;
    }
    else
    {
        
        storeNotMatch = YES;
    }
    
}


-(void)matchTag
{
    
    if (storeNotMatch)
    { NSLog(@"Storing. Not Matching.");
        firstPick.backgroundColor = [UIColor yellowColor];
    }
    else
    {
        NSLog(@"firstPick.tag: %i. secondPick.tag:%i",firstPick.tag, secondPick.tag);
        
        
        if (firstPick.tag == secondPick.tag && firstPick != secondPick)
        {
            NSLog(@"MATCH");
            [self markMatch: firstPick Second:secondPick];
        }
        else
        {
            
            NSLog(@"NO MATCH");
            [self failedPick: firstPick Second: secondPick];
            
            
        }
        
        
        
        
    }
    
}


-(void) updateScores
{
    roundScoreLabel.text = [NSString stringWithFormat:@" Matches: %i    ",successfulMatchCount];
    totalScoreLabel.text = [NSString stringWithFormat:@" Score: %i    ",totalScore];
    missedScoreLabel.text = [NSString stringWithFormat:@" Misses: %i    ",missedScore];
    elapsedTimeLabel.text = [NSString stringWithFormat:@" Time: %i   ",time];
}

#pragma mark DidChooseViewProtocol

-(void)didChooseView:(MYView *) myView
{
    
    
    
    if (storeNotMatch)
    {
        firstPick = myView;
        NSLog(@"firstPick.tag: %i",firstPick.tag);
    }
    else
    {
        secondPick = myView;
        NSLog(@"secondPick: %i",secondPick.tag);
    }
    
    [self matchTag];
    [self switchBoolean];
    
    
}

@end
