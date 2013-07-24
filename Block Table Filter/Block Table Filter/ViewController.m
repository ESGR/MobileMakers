//
//  ViewController.m
//  Block Table Filter
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "FilterLogic.h"
#import "FilteredViewController.h"

@interface ViewController ()
{
    NSMutableArray * randomNumberArray;
    ///NSMutableArray * filteredArray;
    FilterLogic * filterLogic;
    IBOutlet UITableView * tableView;
    UIBarButtonItem * evenButton;
    UIBarButtonItem * oddButton;
    FilteredViewController * filteredViewController;
}

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initwithcoder");
        
        evenButton = [[UIBarButtonItem alloc] initWithTitle:@"Evens" style:UIBarButtonItemStyleDone target:self action:@selector(toEvensView)];
        oddButton = [[UIBarButtonItem alloc] initWithTitle:@"Odds" style:UIBarButtonItemStyleDone target:self action:@selector(toOddsView)];
        
        self.navigationItem.rightBarButtonItems = @[evenButton,oddButton];
                
        ///create random number array
        randomNumberArray = [NSMutableArray arrayWithCapacity:50];
        for (int i=0; i<50; i++)
        {
            [randomNumberArray insertObject:[NSNumber numberWithInt:arc4random()%50] atIndex:i];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) toEvensView
{
    [self performSegueWithIdentifier:@"evensSegue" sender:self];
}
-(void) toOddsView
{
    [self performSegueWithIdentifier:@"oddsSegue" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"evensSegue"])
    {
        FilteredViewController * destination = segue.destinationViewController;
        destination.numberArray =  [self arrayFilter:@"evensOnly" onArray:randomNumberArray];
        
        
    }
    else if ([segue.identifier isEqualToString:@"oddsSegue"])
    {
        FilteredViewController * destination = segue.destinationViewController;
        destination.numberArray = [self arrayFilter:@"oddsOnly" onArray:randomNumberArray];
        
    }
    else
    {
    }
}

///takes in filter type as string from segue, and unsorted array, returns appropriately filtered array
-(NSMutableArray *) arrayFilter: (NSString *) filter onArray: (NSMutableArray *) array
{
    NSMutableArray * filteredArray = [NSMutableArray arrayWithCapacity:0];
    
    if ([filter isEqualToString:@"evensOnly"])
    {
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             int i = [(NSNumber *)obj integerValue];
             
             if (i % 2 == 0)
             {
                 [filteredArray addObject:obj];
             }
             else
             {
                 NSLog(@"odd ommitted");
             }
         }];
        
    }
    else if ([filter isEqualToString:@"oddsOnly"])
    {
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
         {
             int i = [(NSNumber *)obj integerValue];
             
             if (i % 2 == 1)
             {
                 [filteredArray addObject:obj];
             }
             else
             {
                 NSLog(@"even ommitted");
             }
         }];
        
    }
    
    return filteredArray;
    
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [randomNumberArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableViewv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableViewv dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[randomNumberArray objectAtIndex:indexPath.row] ];
    
    
    return cell;
    
}


#pragma mark UITableViewDelegate


@end
