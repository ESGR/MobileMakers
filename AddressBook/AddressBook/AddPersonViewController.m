//
//  AddPersonViewController.m
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "AddPersonViewController.h"
#import "ShowViewController.h"

@interface AddPersonViewController ()
{
    IBOutlet UITextField * firstNameLabel;
    IBOutlet UITextField * lastNameLabel;
    IBOutlet UITextField * emailLabel;
    IBOutlet UITextField * phoneLabel;
    
    __weak IBOutlet UITextField *addressLabel;
    __weak IBOutlet UITextField *workAddressLabel;
    
    Address * homeAddress;
    Address * workAddress;
}

@end

@implementation AddPersonViewController
@synthesize delegate;
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(editSaveToShow)];
    if (person)
    {
        firstNameLabel.text = person.firstName;
        lastNameLabel.text = person.lastName;
        emailLabel.text = person.emailAddress;
        phoneLabel.text = person.phoneNumber;
               
        NSMutableSet * addresses = [person mutableSetValueForKey:@"addresses"];
        NSPredicate *homeAddressPredicate = [NSPredicate predicateWithFormat:@"addressType = 'homeAddress'"];
        NSPredicate *workAddressPredicate = [NSPredicate predicateWithFormat:@"addressType = 'workAddress'"];
                    
        homeAddress = [[addresses filteredSetUsingPredicate:homeAddressPredicate] anyObject];
        workAddress = [[addresses filteredSetUsingPredicate:workAddressPredicate] anyObject];
        addressLabel.text = homeAddress.streetAddress;
        workAddressLabel.text = workAddress.streetAddress;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) editSaveToShow
{
    person.firstName = firstNameLabel.text;
    person.lastName = lastNameLabel.text;
    person.emailAddress = emailLabel.text;
    person.phoneNumber = phoneLabel.text;
    
    homeAddress.streetAddress = addressLabel.text;
    workAddress.streetAddress = workAddressLabel.text;
   
    [delegate refreshData];
    [delegate saveToCoreData];
    
    [self performSegueWithIdentifier:@"EditSaveToShow" sender:self];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"EditSaveToShow" ])
    {
        ShowViewController * destination = segue.destinationViewController;
        destination.person = person;
    }
}


@end
