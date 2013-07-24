//
//  FilterLogic.h
//  Block Table Filter
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger (^filterBlockType) (NSInteger);


@interface FilterLogic : NSObject

@property (readwrite,copy)  filterBlockType filterOutEvens;
@property (readwrite,copy)  filterBlockType filterOutOdds;

@end
