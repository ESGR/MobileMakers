//
//  AddPersonViewController.h
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
# import "addPersonProtocol.h"
#import "Person.h"

@interface AddPersonViewController : UIViewController
@property (strong, nonatomic) id <addPersonProtocol> delegate;
@property (strong, nonatomic) Person * person;

@end
