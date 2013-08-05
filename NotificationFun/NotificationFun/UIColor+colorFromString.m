//
//  UIColor+colorFromString.m
//  NotificationFun
//
//  Created by alexchoi1 on 7/31/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "UIColor+colorFromString.h"

@implementation UIColor (colorFromString)
+(UIColor *) colorFromString: (NSString *) colorString
{
    SEL colorSelector = NSSelectorFromString(colorString);
    if ([self respondsToSelector:colorSelector])
    {
        return [self performSelector:colorSelector];
    }
    else
    {
        return nil;
        ///nil return keeps invalid colors from crashing the app.
    }
}

@end
