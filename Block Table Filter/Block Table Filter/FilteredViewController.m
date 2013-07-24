//
//  FilteredViewController.m
//  Block Table Filter
//
//  Created by alexchoi1 on 7/23/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "FilteredViewController.h"

@interface FilteredViewController ()
{
    IBOutlet UITableView * tableView;
}

@end

@implementation FilteredViewController
@synthesize numberArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

-(void) refresh
{
    [tableView reloadData];
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [numberArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableViewv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableViewv dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[numberArray objectAtIndex:indexPath.row] ];
    
    
    return cell;
    
}



@end
