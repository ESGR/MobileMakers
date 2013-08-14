//
//  ViewController.m
//  Singleton
//
//  Created by alexchoi1 on 8/8/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "MySingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSArray * array1 = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    NSArray * array2= @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    dispatch_async(queue, ^{
        [array1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             [[MySingleton sharedInstance] describe];
             NSLog(@"A1 E:%@", obj);
         }
         ];
    });
    
    
    dispatch_async(queue, ^{
        [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             [[MySingleton sharedInstance] describe];
             NSLog(@"A2 E:%@", obj);
         }
         ];
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
