//
//  MathLogic.h
//  BlockCalculator
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger (^mathType) (NSInteger,NSInteger);

@interface MathLogic : NSObject
@property (readwrite, copy) mathType add;
@property (readwrite, copy) mathType subtract;
@property (readwrite, copy) mathType multiply;
@property (readwrite, copy) mathType divide;

@end
