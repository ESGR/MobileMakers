//
//  ViewController.m
//  CategoryFun
//
//  Created by alexchoi1 on 7/31/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "NSString+mmExtension.h"

@interface ViewController ()
{
    
    __weak IBOutlet UITextField *textField;
    
    __weak IBOutlet UILabel *textLabel;
    
    
    
}

- (IBAction)changeText:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeText:(id)sender {
    textLabel.text = [textField.text reverseString:textField.text];
    

    
}
@end
