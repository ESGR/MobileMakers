//
//  ShowViewController.h
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface ShowViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) Person * person;

@end
