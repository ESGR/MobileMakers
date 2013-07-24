//
//  AddPersonViewController.m
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()
{
    IBOutlet UITextField * firstNameLabel;
    IBOutlet UITextField * lastNameLabel;
    IBOutlet UITextField * emailLabel;
    IBOutlet UITextField * phoneLabel;
    
}
- (IBAction) addPerson: (id) sender;
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
    if (person) {
        firstNameLabel.text = person.firstName;
        lastNameLabel.text = person.lastName;
        emailLabel.text = person.emailAddress;
        phoneLabel.text = person.phoneNumber;
    }
    
    
    NSLog(@"addpersonvcdelegate%@",delegate);
    NSLog(@"addpersonvcperson%@", person);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) addPerson: (id) sender
{
    [delegate modifyPerson:person withFirstName:firstNameLabel.text lastName:lastNameLabel.text email:emailLabel.text phoneNumber:phoneLabel.text];
        [self.navigationController popViewControllerAnimated:YES];
    [delegate refreshData];
    
  }

@end
