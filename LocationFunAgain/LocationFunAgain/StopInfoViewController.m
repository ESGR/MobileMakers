//
//  StopInfoViewController.m
//  LocationFunAgain
//
//  Created by alexchoi1 on 7/30/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "StopInfoViewController.h"

@interface StopInfoViewController ()
{
    IBOutlet UILabel * stopNameLabel;
        IBOutlet UILabel * directionLabel;
        IBOutlet UILabel * routesLabel;
        IBOutlet UILabel * intermodalsLabel;
}

@end

@implementation StopInfoViewController
@synthesize stopName;
@synthesize direction;
@synthesize routes;
@synthesize intermodals;

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
    stopNameLabel.text = [NSString stringWithFormat:@"Stop Name: %@", stopName];
    directionLabel.text = [NSString stringWithFormat:@"Direction: %@", direction];
    routesLabel.text = [NSString stringWithFormat:@"Routes: %@", routes];
    intermodalsLabel.text = [NSString stringWithFormat:@"Intermodals: %@", intermodals];
    
    NSLog(@"stop name %@ direction %@ routes %@ intermodal %@", stopName, direction, routes, intermodals);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
