//
//  WordViewController.m
//  Word Browser
//
//  Created by alexchoi1 on 7/24/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "WordViewController.h"

@interface WordViewController ()
{
    IBOutlet UILabel * wordNameLabel;
    IBOutlet UILabel * wordDefinitionLabel;
    
    IBOutlet UITableView * tableView;
}

@end

@implementation WordViewController
@synthesize word;

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
	// Do any additional setup after loading the view.
    wordNameLabel.text = word.name;
        wordDefinitionLabel.text = word.definition;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numbersections");
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberrows");
    return [word.synonyms count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    ///cell.textLabel.text = [word.synonyms objectAtIndex:indexPath.row];
    NSLog(@"%@",[word.synonyms objectAtIndex:indexPath.row]);
    
   Word * wordForCell = [word.synonyms objectAtIndex:indexPath.row];
    cell.textLabel.text = wordForCell.name;
    
    
        
    return cell;
    
}


#pragma mark UITableViewDelegate


/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///VC pushes a word to wordVC. To keep going to new words, wordVC should check text value of label for selected row, then check against synonyms array for the actual word. will have to be a match for label.text == word.name. then pass word to new wordVC.
    
    /*
    WordViewController * wordViewController = [[WordViewController alloc] init];
    NSIndexPath * indexPathSelectedRow = [tableView indexPathForSelectedRow];

    
    wordViewController.word = tableView 
    [self.navigationController pushViewController:wordViewController animated:YES];    
    
    */

}

@end
