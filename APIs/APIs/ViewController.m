//
//  ViewController.m
//  APIs
//
//  Created by alexchoi1 on 7/25/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UITableView * tableView;
    NSArray * superheroArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL * url = [NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"];
    
    NSLog(@"URL:%@",url);
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //NSURLResponse * response;
    //NSError * error;
    // NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         NSLog(@"inside block");
         
        superheroArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         NSMutableString * superheroString = [[NSMutableString alloc] init];
         
         [tableView reloadData];
         
         
  
     }];
    NSLog(@"after block");
    
    
    [super viewDidLoad];
    
    
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
    return superheroArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"superheroTable"];
    NSDictionary * superheroDictionary = [superheroArray objectAtIndex:indexPath.row];
    NSString *name = [superheroDictionary objectForKey:@"name"];
    NSString *description = [superheroDictionary objectForKey:@"description"];
    
 
    NSURL * url = [NSURL URLWithString:[superheroDictionary objectForKey:@"avatar_url"]];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * image = [UIImage imageWithData:data];    
    
  
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"superheroTable"];
    }
    
    cell.textLabel.text = name;
    cell.detailTextLabel.text = description;
    cell.imageView.image = image;
    
    return cell;
    
    
}

@end
