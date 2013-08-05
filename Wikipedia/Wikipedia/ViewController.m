//
//  ViewController.m
//  Wikipedia
//
//  Created by alexchoi1 on 7/25/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "SnippetsViewController.h"

@interface ViewController ()
{
    IBOutlet UITextField * textField;
    IBOutlet UIButton * button;
    IBOutlet UITableView *tableView;
    
    NSMutableDictionary * resultsDictionary;
    NSMutableDictionary * queryDictionary;
    NSMutableArray * searchArray; //searchArray is an array of dictionaries. each dictionary has a key for the title snippet and ns
}

-(IBAction)searchWiki:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchWiki:(id)sender
{
    NSString * searchTerm1 = textField.text;
    NSString * searchTerm = [searchTerm1 stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString * wikiString1 = @"https://en.wikipedia.org/w/api.php?%20action=query&list=search&srsearch=";
    NSString * wikiString2 = @"&srprop=snippet&format=json";
    NSString * stringForURL = [NSString stringWithFormat:@"%@%@%@",wikiString1,searchTerm,wikiString2];
    NSURL * url = [NSURL URLWithString:stringForURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error)
     {
         resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
         queryDictionary =  [resultsDictionary objectForKey:@"query"];
         searchArray =  [queryDictionary objectForKey:@"search"];
  
         [tableView reloadData];
     }];
    [textField resignFirstResponder];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SnippetsViewController * snippetsViewController = segue.destinationViewController;
    
    NSIndexPath * indexPath =    [tableView indexPathForSelectedRow];
    
    NSDictionary * article = [searchArray objectAtIndex:indexPath.row];
    
    NSString *    snippetText = [article objectForKey:@"snippet"];
    
    snippetsViewController.textValue = snippetText;
}


#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchArray.count;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"wikiTitles"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"wikiTitles"];
    }
    
    NSDictionary * article = [searchArray objectAtIndex:indexPath.row];
    NSString * title = [article objectForKey:@"title"];
    
    cell.textLabel.text = title;
    
    return cell;
}




#pragma mark UITableViewDelegate
/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toSnippetView" sender:self];
}





@end
