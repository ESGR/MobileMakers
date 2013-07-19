//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Judge.h"
#import "ComputerHand.h"

@interface ViewController ()
{
    NSArray*                choices;
    NSTimer*                timer;
    int                     count;
    Judge *                 roundJudge;
    ComputerHand *          roundComputerHand;

    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}
- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
@end

@implementation ViewController




-(void)showWinner
{
    NSLog(@"showWinner");
    BOOL computerWon = 0;
    NSLog(@"computer won %i",computerWon);
    
    
    
    //NSLog(@"computer hand %@",computerHandLabel.text);
    //NSLog(@"player hand %@", playerHandLabel.text);
    
    
    
    computerWon = [roundJudge didComputerWin:roundComputerHand->computerHand didPlayerWin:playerHandLabel.text];
                   //computerHandLabel.text  
    
    NSLog(@"computer won %i",computerWon);
    NSLog(@"access instance variable computerHand %@ computerWon = %i", roundComputerHand->computerHand, computerWon);
    
    if (computerWon) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
    }
    else{
        playerHandLabel.backgroundColor = [UIColor greenColor];
    }
    
    
    
    
}


- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];

    choices = @[@"rock", @"paper", @"scissors"];
    count = 3;
    [self updateCount];
    roundJudge = [[Judge alloc] init];
    NSLog(@"created roundjudge");
    roundComputerHand = [[ComputerHand alloc] init];
    
    
  
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    NSLog(@"updateCount");
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    NSLog(@"countDown");
    count--;
    [self updateCount];
    
    if (count == 0) {
        [timer invalidate];
        count = 4;
        computerHandLabel.text = [roundComputerHand createComputerHand];
    }
}


- (IBAction)start:(id)sender
{
    NSLog(@"IBAction start");
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.backgroundColor = [UIColor whiteColor];
    

}

- (IBAction)rock:(id)sender
{
     NSLog(@"IBAction rock");
    playerHandLabel.text = @"rock";
    [self showWinner];
}

- (IBAction)paper:(id)sender
{
     NSLog(@"IBAction paper");
    playerHandLabel.text = @"paper";
    [self showWinner];
}

- (IBAction)scissors:(id)sender
{
     NSLog(@"IBAction scissors");
    playerHandLabel.text = @"scissors";
    [self showWinner];
}


@end
