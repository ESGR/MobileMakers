//
//  ViewController.m
//  NotificationFun
//
//  Created by alexchoi1 on 7/31/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    IBOutlet UITextField * textField;
}

-(IBAction)changeColor:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserverForName: UIApplicationWillEnterForegroundNotification object: nil queue: [NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
     {
         NSLog(@"HOWRO");
     }];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) changeColor: (id) sender
{
    NSString * text = textField.text;
    NSString * colorText = [NSString stringWithFormat:@"%@Color",text];
    NSDictionary * colorDictionary = [NSDictionary dictionaryWithObject:colorText forKey:@"color"];
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter postNotificationName:@"ChangeColor" object:nil userInfo:colorDictionary];
    [textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
