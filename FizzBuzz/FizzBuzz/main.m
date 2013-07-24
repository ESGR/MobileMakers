//
//  main.m
//  FizzBuzz
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 Write a program that prints out the numbers 1 to 100 (inclusive).
 If the number is divisible by 3, print Fizz instead of the number. If it's divisible by 5, print Buzz. If it's divisible by both 3 and 5, print FizzBuzz.
 */

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        {
            for ( int i=1; i<=100; i++) {
                if (i%3 == 0 && i%5 ==0)
                {
                    NSLog(@"FizzBuzz");
                }
                else if (i% 3 == 0)
                {
                    NSLog(@"Fizz");
                }
                else if (i% 5 == 0)
                {
                    NSLog(@"Buzz");
                }
                else
                {
                    NSLog(@"%i",i);
                }
            }
        }
        
        
        
        
    }
    return 0;
}
