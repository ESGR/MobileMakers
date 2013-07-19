//
//  ViewController.m
//  MagicEightBall
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "MagicEightBall.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *answerLabel;
    MagicEightBall * magicEightBall;
}
- (IBAction)shake:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  magicEightBall = [[MagicEightBall alloc] init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shake:(id)sender
{
    answerLabel.text = @"needs work!";
    
    NSString * answer = [magicEightBall createAnswer];
    answerLabel.text = answer;
    
    // add your code here.  Call a method on your class that returns one of several random strings.
}
@end
