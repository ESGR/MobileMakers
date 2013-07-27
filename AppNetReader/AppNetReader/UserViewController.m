//
//  UserViewController.m
//  AppNetReader
//
//  Created by alexchoi1 on 7/27/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()
{
    NSDictionary * resultsDictionary;
    IBOutlet UITableView * tableView;
}

@end

@implementation UserViewController
@synthesize userID;

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
    
    NSString * stringForURL = [NSString stringWithFormat:@"https://alpha-api.app.net/stream/0/users/%@/posts",userID] ;
    NSURL * url = [NSURL URLWithString:stringForURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         [tableView reloadData];
     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * dataArray = [resultsDictionary objectForKey:@"data"];
    return    dataArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"appnet"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"appnet"];
    }
    
    NSArray * dataArray = [resultsDictionary objectForKey:@"data"];
    NSDictionary * post =  [dataArray objectAtIndex:indexPath.row];
    NSString * postContent = [post objectForKey:@"text"];
    
    cell.textLabel.text = postContent;
    
    return cell;
}


#pragma mark UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}



@end
