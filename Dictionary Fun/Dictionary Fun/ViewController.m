//
//  ViewController.m
//  Dictionary Fun
//
//  Created by alexchoi1 on 7/24/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    Person *    personOne = [[Person alloc] init];
    Person *    personTwo = [[Person alloc] init];
    Person *    personThree = [[Person alloc] init];
    NSMutableDictionary * personDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    NSMutableArray * personArray = [NSMutableArray arrayWithCapacity:2];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    personOne.firstName = @"don";
    personTwo.firstName = @"andres";
    personThree.firstName = @"eddie";
    
    personOne.lastName = @"adams";
    personTwo.lastName = @"barney";
    personThree.lastName = @"barney";
    
    [personArray insertObject:personTwo atIndex:0];
    [personArray insertObject:personThree atIndex:1];
    
    [personDictionary setObject:personArray forKey:@"B"];
    [personDictionary setObject:personOne forKey:@"A"];
    
    [self describeDictionary:personDictionary];
    
    
    
}

-(void) describeDictionary: (NSDictionary *) dictionary
{
    NSLog(@"Keys: %@", [dictionary allKeys]);
    NSLog(@"Values: %@", [dictionary allValues]);
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
if ([value isKindOfClass:[Person class]])
{
    NSLog(@"%@ %@",((Person *)value).firstName, ((Person *)value).lastName);
}
        else if ([value isKindOfClass:[NSArray class]])
        {
            [((NSArray *)value) enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSLog(@"%@ %@",((Person *)obj).firstName,((Person *)obj).lastName);
            }
        ];
        }
     
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
