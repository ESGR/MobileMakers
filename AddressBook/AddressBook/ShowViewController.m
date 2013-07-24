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
 
    
    NSMutableArray * detailsArray;
    
    IBOutlet UITableView * detailsTable;
    
   /// BOOL editing;
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
    
  
    int i = 0;
    
    
    detailsArray = [NSMutableArray arrayWithCapacity:0];
    
    if (person.firstName)
    {
    [detailsArray insertObject:person.firstName atIndex:i];
        i++;
    }
    
    if (person.lastName)
    {
    [detailsArray insertObject:person.lastName atIndex:i];
        i++;
    }
    if (person.emailAddress)
    {
        [detailsArray insertObject:person.emailAddress atIndex:i];
        i++;

    }
    if (person.phoneNumber)
    {
        [detailsArray insertObject:person.phoneNumber atIndex:i];
        i++;

    }
        /*
    firstName.text = person.firstName;
    lastName.text = person.lastName;
    emailAddress.text = person.emailAddress;
    phoneNumber.text = person.phoneNumber;
     */
    
    
    
    }



-(void) navEdit
{
           
            
        [self performSegueWithIdentifier:@"toEditPerson" sender:self];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"toEditPerson" ])
    
    {
        AddPersonViewController * destination = segue.destinationViewController;
        destination.person    = person;
///NEED TO ASSIGN VC AS DELEGATE TO ADDPERSONVC FOR EDIT
        NSLog(@"person%@",person);
        NSLog(@"destinationperson%@",destination.person);
        
        
    }
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
    return [detailsArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    
    NSString * detail = [detailsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = detail;
    
    
    return cell;
    
}


#pragma mark UITableViewDelegate

/*
/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    showViewController = [[ShowViewController alloc] init];
    ///pass person at cell to instance variable which will then be passed to showViewController with prepareForSegue
    
    personSending = [peopleArray objectAtIndex:indexPath.row];
    
    ///showViewController.person = [peopleArray objectAtIndex:indexPath.row];
    /// [self.navigationController pushViewController:showViewController animated:YES];
    
    [self performSegueWithIdentifier:@"toShowViewController" sender:self];
    
}
*/

@end
