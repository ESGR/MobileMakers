//
//  ViewController.m
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ShowViewController.h"
#import "AddPersonViewController.h"
#import "AppDelegate.h"
#import "AddressBookSingleton.h"

@interface ViewController ()
{
    ShowViewController * showViewController;
    AddPersonViewController * addPersonViewController;
    
    __weak IBOutlet UISearchBar *oSearchBar;
    IBOutlet UITableView * oTableView;

    NSMutableArray * coreDataPeopleArray;
    NSMutableArray * filteredPeopleArray;
}

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        NSLog(@"initwithcoder");
        NSLog(@"vc%@",self);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(toAddPersonView)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    coreDataPeopleArray = [[NSMutableArray alloc] initWithCapacity:50];
    filteredPeopleArray = [[NSMutableArray alloc] initWithCapacity:50];
    [self fetchFromCoreData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"ListToShow" ])
    {
        ShowViewController * destination = segue.destinationViewController;
        destination.person = [coreDataPeopleArray objectAtIndex:oTableView.indexPathForSelectedRow.row];
    }
    else if ([segue.identifier isEqual:@"ListToEdit" ])
    {
        ///"edit" here is to create a person. we are "editing" a blank person
        AddPersonViewController * destination = segue.destinationViewController;
        destination.delegate    = self;
        destination.person = [self makePerson];
        
    }
}

-(void) toAddPersonView
{
    [self performSegueWithIdentifier:@"ListToEdit" sender:self];
}


-(Person *) makePerson
{
    Person * person = [[AddressBookSingleton sharedInstance] newObjectForEntityForName:@"Person"];
    [person addAddressesObject:[self makeAddressofType:@"homeAddress"]];
    [person addAddressesObject:[self makeAddressofType:@"workAddress"]];
    [coreDataPeopleArray addObject:person];
    
    return person;
}

-(Address *) makeAddressofType: (NSString *) type
{
    Address * address = [[AddressBookSingleton sharedInstance] newObjectForEntityForName:@"Address"];
    address.addressType = type;
    address.streetAddress = @"";
    
    return address;
}

-(void) fetchFromCoreData
{
    NSArray *   fetchedArray =  [[AddressBookSingleton sharedInstance] fetchFromCoreData];
    coreDataPeopleArray =  [NSMutableArray arrayWithArray:fetchedArray];
}

#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredPeopleArray count];
    } else {
        return [coreDataPeopleArray count];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }

    Person * person;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
       person = [filteredPeopleArray objectAtIndex:indexPath.row];
    }
    else
    {
       person = [coreDataPeopleArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = person.firstName;
     [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;

    
}


#pragma mark UITableViewDelegate


/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ListToShow" sender:self];
}

#pragma mark addPersonProtocol

-(void) refreshData
{
    [oTableView reloadData];
    [showViewController refresh];
}


-(void) saveToCoreData
{
    [[AddressBookSingleton sharedInstance] saveToCoreData];
}



#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [filteredPeopleArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.firstName contains[c] %@",searchText];
    filteredPeopleArray = [NSMutableArray arrayWithArray:[coreDataPeopleArray filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
@end
