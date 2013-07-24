//
//  Word.h
//  Word Browser
//
//  Created by alexchoi1 on 7/24/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject
///name definition synonyms
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * definition;
@property (strong, nonatomic) NSMutableArray * synonyms;
@end
