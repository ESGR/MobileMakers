//
//  ViewController.m
//  LocationFunAgain
//
//  Created by alexchoi1 on 7/30/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "MapAnnotationObject.h"
#import "MudkipAnnotationView.h"
#import "StopInfoViewController.h"


@interface ViewController ()
{
    IBOutlet MKMapView * mapView;
}
- (IBAction)changeImage:(id)sender;
@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        

    
    
    NSString * stringForURL = [NSString stringWithFormat:@"http://mobilemakers.co/lib/bus.json"];
    NSURL * url = [NSURL URLWithString:stringForURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         NSDictionary * resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         NSArray * rowArray = [resultsDictionary objectForKey:@"row"];
         
         [rowArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
             NSDictionary * stopDictionary = obj;
             
             float latitude =   [[stopDictionary objectForKey:@"latitude"] floatValue];
             float longitude =   [[stopDictionary objectForKey:@"longitude"] floatValue];
             NSArray * routeArray =  [stopDictionary objectForKey:@"routes"];
             NSString * routeString = [stopDictionary objectForKey:@"routes"];
             NSString * stopName = [stopDictionary objectForKey:@"cta_stop_name"];
             int stopID = [[stopDictionary objectForKey:@"stop_id"] intValue];
             NSString * direction = [stopDictionary objectForKey:@"direction"];
             NSString * intermodal = [stopDictionary objectForKey:@"inter_modal"];
             MapAnnotationObject * ctaStop = [[MapAnnotationObject alloc] init];
             ctaStop.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
             ctaStop.routes = routeArray; //had trouble with routearray
             ctaStop.title = stopName;
             ctaStop.routeString = routeString;
             ctaStop.subtitle = [NSString stringWithFormat:@"Routes: %@",routeString];
             ctaStop.stopID = stopID;
             ctaStop.direction = direction;
             ctaStop.intermodal = intermodal;
             ctaStop.stopName = stopName;
             
             
             [mapView addAnnotation:ctaStop];
             
             
         }];
     } ];
   	// Do any additional setup after loading the view, typically from a nib.
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(41.9, -87.65);
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    
    [mapView setRegion:region];
    
    MapAnnotationObject * mobileMakers = [[MapAnnotationObject alloc] init];
    mobileMakers.title = @"Mobile Makers";
    mobileMakers.coordinate = coordinate;
    
    [mapView addAnnotation:mobileMakers];
    
    UISwipeGestureRecognizer * swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [self.view addGestureRecognizer:swipeDownRecognizer];
    swipeDownRecognizer.delegate = self;
    swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    UISwipeGestureRecognizer * swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [self.view addGestureRecognizer:swipeUpRecognizer];
    swipeUpRecognizer.delegate = self;
    swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer * swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    swipeLeftRecognizer.delegate = self;
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    
    UISwipeGestureRecognizer * swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [self.view addGestureRecognizer:swipeRightRecognizer];
    swipeRightRecognizer.delegate = self;
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;

    /*
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:mapView action:@selector(showPan)];
    panGesture.delegate = self;
    [mapView addGestureRecognizer:panGesture];
    [swipeRightRecognizer requireGestureRecognizerToFail:panGesture];
    [swipeLeftRecognizer requireGestureRecognizerToFail:panGesture];
    [swipeUpRecognizer requireGestureRecognizerToFail:panGesture];
    [swipeDownRecognizer requireGestureRecognizerToFail:panGesture];
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MudkipAnnotationView * mudkipAnnotationView = sender;
    MapAnnotationObject * customMapAnnotation =    mudkipAnnotationView.annotation;
    StopInfoViewController * stopInfoViewController = segue.destinationViewController;
    
    stopInfoViewController.stopName = customMapAnnotation.title;
    stopInfoViewController.direction = customMapAnnotation.direction;
    stopInfoViewController.intermodals = customMapAnnotation.intermodal;
    stopInfoViewController.routes = customMapAnnotation.routeString;
    
    
}

- (IBAction)changeImage:(id)sender
{
    NSLog(@"sender%@",sender);
    UIImage * poliwagImage =     [UIImage imageNamed:@"NickCagePoliwag"];
    UIImage * jigglypuffImage =     [UIImage imageNamed:@"NickCageJigglyPuff"];
    UIImage * bulbasaurImage =     [UIImage imageNamed:@"NickCageBulbasaur"];
    UIImage * weedleImage =     [UIImage imageNamed:@"NickCageWeedle"];

    UIImage * chosenImage;
    UISwipeGestureRecognizer * swipeGestureRecognizer = sender;
    
    if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown)
    {
        chosenImage = bulbasaurImage;
    }
    else if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
       chosenImage = poliwagImage;
    }
    else if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        chosenImage = weedleImage;
    }
    else
    {
        chosenImage = jigglypuffImage;
    }
    
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"changeImage" object:chosenImage userInfo:nil];

    
}
-(void) move: (id) sender
{
    NSLog(@"move!");
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{ return YES;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}



#pragma mark MKMapViewDelegate

-(MKAnnotationView *)mapView:(MKMapView *) _mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    ///only makes annotationview for my custom mapannotationobject class
    if ([annotation isKindOfClass:[MapAnnotationObject class]])
    {
        
        MapAnnotationObject * mapAnnotationObject = annotation;
        MKAnnotationView * annotationView;
        annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationIdentifier"];
        
        if(!annotationView)
        {
            annotationView = [[MudkipAnnotationView alloc] initWithAnnotation:mapAnnotationObject reuseIdentifier:@"AnnotationIdentifier"];
            annotationView.canShowCallout = YES;
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
                        
            
            
            
            
            
            
            
        }
        else
        {
            annotationView.annotation = mapAnnotationObject;
        }
        
        return annotationView;
    }
}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    [self performSegueWithIdentifier:@"toStopInfo" sender:view];
    
    MudkipAnnotationView * mudkipAnnotationView = view;
    MapAnnotationObject * mapAnnotationObject = view.annotation;
    
}

@end
