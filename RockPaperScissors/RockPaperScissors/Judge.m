//
//  Judge.m
//  RockPaperScissors
//
//  Created by alexchoi1 on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Judge.h"

@implementation Judge


/*Add a method to that class called didComputerWin that takes two NSStrings as parameters and returns a BOOL
 4. By comparing the strings, determine if the computer won and return the boolean
 5. Instantiate the Judge and determine where to use the new judge object to make that method call. (hint: alloc] init])*/

- (BOOL) didComputerWin: (NSString *) computerHand didPlayerWin: (NSString *) playerHand


{
    
    
    NSLog(@"computer hand: %@",computerHand);
    NSLog(@"player hand: %@",playerHand);
    if ([computerHand isEqualToString: @"rock"] && [playerHand isEqualToString: @"scissors"])
    {
        return YES;
        NSLog(@"computer rock beats human scissors");
    }
    else if ([computerHand isEqualToString: @"paper"] && [playerHand isEqualToString: @"rock"])
    {
        return YES;
    NSLog(@"computer paper beats human rock");
    }
    else if ([computerHand isEqualToString: @"scissors"] && [playerHand isEqualToString:@"paper"])
    {
        return YES;
    NSLog(@"computer scissors beats human paper");
    }
    else
    {
        NSLog(@"else ");
       return NO;
    }
    
}



@end
