//
//  SnippetsViewController.m
//  Wikipedia
//
//  Created by alexchoi1 on 7/25/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "SnippetsViewController.h"

@interface SnippetsViewController ()
{
    IBOutlet UITextView * textView;
}

@end

@implementation SnippetsViewController
@synthesize textValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    textView.text = textValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
