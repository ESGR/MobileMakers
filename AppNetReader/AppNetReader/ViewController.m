//
//  ViewController.m
//  AppNetReader
//
//  Created by alexchoi1 on 7/27/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "UserViewController.h"

@interface ViewController ()
{
    NSDictionary * resultsDictionary;
    IBOutlet UITableView * tableView;
    IBOutlet UIActivityIndicatorView * activityIndicator;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(pullData)];
    
    [self pullData];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSIndexPath * indexPath = [tableView indexPathForSelectedRow];
    
    NSArray * dataArray = [resultsDictionary objectForKey:@"data"];
    NSDictionary * post =  [dataArray objectAtIndex:indexPath.row];
    
    NSDictionary * user = [post objectForKey:@"user"];
    NSString * userID = [user objectForKey:@"id"];
    
    UserViewController * userViewController = segue.destinationViewController;
    userViewController.userID = userID;
}

-(void) pullData
{
    NSLog(@"pull");
    NSString * stringForURL = @"https://alpha-api.app.net/stream/0/posts/stream/global";
    NSURL * url = [NSURL URLWithString:stringForURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [activityIndicator startAnimating];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         [tableView reloadData];
         [activityIndicator stopAnimating];
     }];
    
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
    NSDictionary * user = [post objectForKey:@"user"];
    NSString * userName = [user objectForKey:@"username" ];
    
    cell.textLabel.text = postContent;
    cell.detailTextLabel.text = userName;
    
    return cell;
}


#pragma mark UITableViewDelegate
/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toUserView" sender:self];
}

@end
