//
//  MathLogic.m
//  BlockCalculator
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "MathLogic.h"

@implementation MathLogic
@synthesize add;
@synthesize subtract;
@synthesize multiply;
@synthesize divide;


-(id) init
{
    self = [super init];
    if (self)
    {
        add = ^(NSInteger int1, NSInteger int2)
        {
            return int1 + int2;
        };
        
        subtract = ^(NSInteger int1, NSInteger int2)
        {
            return int1 - int2;
        };
        
        multiply = ^(NSInteger int1, NSInteger int2)
        {
            return int1 * int2;
        };
        
        divide = ^(NSInteger int1, NSInteger int2)
        {
            return int1 / int2;
        };
    }
    return self;
}


@end
