//
//  NSString+mmExtension.m
//  CategoryFun
//
//  Created by alexchoi1 on 7/31/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "NSString+mmExtension.h"

@implementation NSString (mmExtension)

-(NSString *) reverseString: (NSString *) string
{
   // NSMutableString * mString = [NSMutableString stringWithString:string];
    
NSString *    newString = @"";
    for (int i=0; i< string.length; i++) {
        
        newString = [NSString stringWithFormat:@"%@%c",newString,[string characterAtIndex:string.length-i-1]];
    }
    return newString;
    
}
@end
