//
//  ViewController.m
//  LocationFun
//
//  Created by alexchoi1 on 7/29/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"

@interface ViewController ()
{
    CLLocationManager * locationManager;
    IBOutlet MKMapView * mapView;
    IBOutlet UITextField * searchInput;
    
    CLLocationCoordinate2D  coordinate;
    
    SearchViewController * searchViewController;
    
}
-(IBAction)sendLocation:(id)sender;

@end

@implementation ViewController



-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
       // locationManager = [[CLLocationManager alloc] init];
       // locationManager.delegate = self;
        mapView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    coordinate = CLLocationCoordinate2DMake(41.893732, -87.635322);
    [self setMapRegion];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sendLocation:(id)sender
{
    NSString * searchInputString = [searchInput.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSString * stringForURL = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", searchInputString ];
    NSURL * url = [NSURL URLWithString:stringForURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         NSDictionary * resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         NSArray * resultsArray = [resultsDictionary objectForKey:@"results"];
         NSDictionary * zeroDictionary = [resultsArray objectAtIndex:0];
         NSDictionary * geometryDictionary = [zeroDictionary objectForKey:@"geometry"];
         NSDictionary * locationDictionary = [geometryDictionary objectForKey:@"location"];
         
         coordinate.latitude = [[locationDictionary objectForKey:@"lat"] floatValue];
         coordinate.longitude = [[locationDictionary objectForKey:@"lng"] floatValue];
         
         [self setMapRegion];
         
     }];
    
    [searchInput resignFirstResponder];
    
    [self setMapRegion];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"did update locations: %@",[locations objectAtIndex:0]);
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@", error);
}

-(void) setMapRegion
{
        MKCoordinateRegion coordinateRegion = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(.01, .01));
    
    mapView.region = coordinateRegion;
}
@end
