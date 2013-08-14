//
//  MySingleton.m
//  Singleton
//
//  Created by alexchoi1 on 8/8/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton


static MySingleton * sMySingleton;



+ (MySingleton *) sharedInstance
{
    

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sMySingleton = [[MySingleton alloc] init];
    });
    
    
    return sMySingleton;
}

- (id) init
{
    self = [super init];
    
    if (self)
    {
        NSLog(@"instantiating my singleton %@", self);
    }
    return self;
}

- (void) describe
{
    NSLog(@"My Singleton %@", self);
}

@end
