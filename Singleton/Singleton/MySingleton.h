//
//  MySingleton.h
//  Singleton
//
//  Created by alexchoi1 on 8/8/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

+ (MySingleton *) sharedInstance;
- (void) describe;


@end
