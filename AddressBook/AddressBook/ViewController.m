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

@interface ViewController ()
{
    NSMutableArray * peopleArray;
    ShowViewController * showViewController;
    AddPersonViewController * addPersonViewController;
    Person * personSending;
    UIBarButtonItem *rightButton;
    BOOL editing;
    
    IBOutlet UITableView * tableView;
}

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initwithcoder");
        peopleArray = [[NSMutableArray alloc] initWithCapacity:10];
        
        Person * alice = [[Person alloc] init];
        Person * bob = [[Person alloc] init];
        Person * chelsea = [[Person alloc] init];
        Person * delilah = [[Person alloc] init];
        Person * eliot = [[Person alloc] init];
        
        alice.firstName = @"Alice";
        bob.firstName = @"Bob";
        chelsea.firstName = @"Chelsea";
        delilah.firstName = @"Delilah";
        eliot.firstName = @"Eliot";
        
        alice.emailAddress = @"Alice@gmail.com";
        bob.emailAddress = @"Bob@gmail.com";
        chelsea.emailAddress = @"Chelsea@gmail.com";
        delilah.emailAddress = @"Delilah@gmail.com";
        eliot.emailAddress = @"Eliot@gmail.com";
        
        
        
        
        
        [peopleArray insertObject:alice atIndex:0];
        [peopleArray insertObject:bob atIndex:1];
        [peopleArray insertObject:chelsea atIndex:2];
        [peopleArray insertObject:delilah atIndex:3];
        [peopleArray insertObject:eliot atIndex:4];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(toAddPersonView)];
   
        
        
    }
    return self;
}

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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"toShowViewController" ])
    {
    ///grabs person from instance variable to be passed to showViewController
    ShowViewController * destination = segue.destinationViewController;
    destination.person =personSending;
    }
    else if ([segue.identifier isEqual:@"toAddPerson" ])
    {
        AddPersonViewController * destination = segue.destinationViewController;
        destination.delegate    = self;
        destination.person = [self makePerson];


    }
}

-(void) toAddPersonView
{
 
   /// addPersonViewController = [[AddPersonViewController alloc] init];
    
    [self performSegueWithIdentifier:@"toAddPerson" sender:self];
    
    }


-(Person *) makePerson
{
    Person * person = [[Person alloc] init];
    [peopleArray addObject:person];
    [tableView reloadData];
    return person;
}



#pragma mark UITableViewDataSource

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [peopleArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
    }
    
    Person * person = [peopleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = person.firstName;
    
    
    return cell;
    
}


#pragma mark UITableViewDelegate


/// for passing cell contents to new viewcontroller on touching/selecting cell
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   /// showViewController = [[ShowViewController alloc] init];
    ///pass person at cell to instance variable which will then be passed to showViewController with prepareForSegue
    
    personSending = [peopleArray objectAtIndex:indexPath.row];
    
    ///showViewController.person = [peopleArray objectAtIndex:indexPath.row];
    /// [self.navigationController pushViewController:showViewController animated:YES];
    
    [self performSegueWithIdentifier:@"toShowViewController" sender:self];
    
}

#pragma mark addPersonProtocol
-(Person *) modifyPerson: (Person *) personv withFirstName: (NSString *) first lastName: (NSString *) last email: (NSString *) email phoneNumber: (NSString *) phone
{
    
    personv.firstName = first;
    personv.lastName = last;
    personv.emailAddress = email;
    personv.phoneNumber = phone;
    
    return personv;
    
    
    
    
}
-(void) refreshData
{
    [tableView reloadData];

}

@end
