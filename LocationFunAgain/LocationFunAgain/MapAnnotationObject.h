//
//  MapAnnotationObject.h
//  LocationFunAgain
//
//  Created by alexchoi1 on 7/30/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotationObject : NSObject <MKAnnotation>
@property (strong,nonatomic) NSString * stopName;
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * subtitle;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (strong,nonatomic) NSArray * routes;
@property (strong,nonatomic) NSString * routeString;
@property (strong, nonatomic) NSString * direction;
@property (assign,nonatomic) int stopID;
@property (strong,nonatomic) NSString * intermodal;
@end
