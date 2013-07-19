//
//  ComputerHand.m
//  RockPaperScissors
//
//  Created by alexchoi1 on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ComputerHand.h"
@interface ComputerHand ()


@end
@implementation ComputerHand

- (NSString *) createComputerHand
{
    NSArray * choices = @[@"rock", @"paper", @"scissors"];
    
    NSString * computerHandLabel;
    
    computerHandLabel = [choices objectAtIndex:arc4random() % 3];
    computerHand = computerHandLabel;
    return computerHandLabel;
}


@end
