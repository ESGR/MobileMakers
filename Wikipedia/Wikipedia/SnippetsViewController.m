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
    IBOutlet UIWebView * webView;
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
    [webView loadHTMLString:textValue baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
