//
//  ShowViewController.m
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ShowViewController.h"
#import "AddPersonViewController.h"

@interface ShowViewController ()
{
    IBOutlet UITableView * detailsTable;
    NSMutableDictionary *personDictionary;
    NSMutableArray * orderArray;
}


@end

@implementation ShowViewController
@synthesize person;

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(navEdit)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"All Contacts" style:UIBarButtonItemStyleBordered target:self action:@selector(backToList)];
    
    
    int i = 0;
    
    
    NSMutableSet * addresses = [person mutableSetValueForKey:@"addresses"];
    NSPredicate *homeAddressPredicate = [NSPredicate predicateWithFormat:@"addressType = 'homeAddress'"];
    NSPredicate *workAddressPredicate = [NSPredicate predicateWithFormat:@"addressType = 'workAddress'"];
    
    Address * homeAddress = [[addresses filteredSetUsingPredicate:homeAddressPredicate] anyObject];
    Address * workAddress = [[addresses filteredSetUsingPredicate:workAddressPredicate] anyObject];
    
    personDictionary = [NSMutableDictionary dictionaryWithCapacity:6];
    orderArray = [NSMutableArray arrayWithCapacity:6];
    
    if (!person.firstName.length == 0)
    {
        [personDictionary setObject: person.firstName forKey:@"First Name"];
        [orderArray addObject:@"First Name"];
        i++;
    }
    
    if (!person.lastName.length == 0)
    {
        [personDictionary setObject: person.lastName forKey:@"Last Name"];
        [orderArray addObject: @"Last Name"];
        i++;
    }
    if (!person.emailAddress.length == 0)
    {
        [personDictionary setObject: person.emailAddress  forKey:@"Email Address"];
        [orderArray addObject:@"Email Address"];
        i++;
    }
    if (!person.phoneNumber.length == 0)
    {
        [personDictionary setObject: person.phoneNumber  forKey:@"Phone Number"];
        [orderArray addObject:@"Phone Number"];
        i++;
    }
    if (!homeAddress.streetAddress.length == 0)
    {
        [personDictionary setObject: homeAddress.streetAddress  forKey:@"Home Address"];
        [orderArray addObject:@"Home Address"];
        i++;
    }
    if (!workAddress.streetAddress.length == 0)
    {
        [personDictionary setObject: workAddress.streetAddress  forKey:@"Work Address"];
        [orderArray addObject:@"Work Address"];
        i++;
    }
}

-(void) refresh
{
    [detailsTable reloadData];
}

-(void) navEdit
{
    [self performSegueWithIdentifier:@"ShowToEdit" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"ShowToEdit" ])
        
    {
        AddPersonViewController * destination = segue.destinationViewController;
        destination.person = person;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) backToList
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [orderArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"id1"];
    }
    
    NSString * key = [orderArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text  = [personDictionary objectForKey:key];
    cell.textLabel.text = key;
    
    return cell;
    
}



@end
