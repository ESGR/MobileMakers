//
//  FilterLogic.m
//  Block Table Filter
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "FilterLogic.h"

@implementation FilterLogic
@synthesize filterOutEvens;
@synthesize filterOutOdds;

-(id) init
{
    self = [super init];
    if (self)
    {
        ///if not divisible by 2, return number, else 0
        filterOutEvens = ^(NSInteger int1)
        {
            if (int1 % 2 == 1)
            {
                return int1;
            }
            else
            {
                return 0;
            }
        };
        ///if divisible by 2, return number, else 0
        filterOutOdds = ^(NSInteger int1)
        {
            if (int1 % 2 == 0)
            {
                return int1;
            }
            else
            {
                return 0;
            }
        };
        
    }
    
    return self;
    
}

@end
