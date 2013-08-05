//
//  SearchViewController.m
//  LocationFun
//
//  Created by alexchoi1 on 7/29/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
{
    IBOutlet UITextField * searchTextField;
}

-(IBAction) submitSearch: (id) sender;

@end

@implementation SearchViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction) submitSearch: (id) sender
{
   

}
@end
