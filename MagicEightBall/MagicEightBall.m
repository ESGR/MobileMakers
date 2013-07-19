//
//  MagicEightBall.m
//  MagicEightBall
//
//  Created by alexchoi1 on 7/9/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "MagicEightBall.h"

/*
 1. Create a MagicEightBall class
 2. Add a method on that class that returns a random string
 3. Import the MagicEightBall class into ViewController.m class file (hint: import the header file)
 4. Call your method to return your random string.
 5. Assign that string to answerLabel.text
 */

@implementation MagicEightBall

-(NSString *) createAnswer
{    
    NSArray * answers = @[@"you will die soon", @"try again", @"you will find love soon", @"stop shaking me", @"maybe you should have the salad"];
    
    NSString * theAnswer = [answers objectAtIndex:arc4random() %  5];
    
    return theAnswer;
}

@end
