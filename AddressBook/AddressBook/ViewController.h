//
//  ViewController.h
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addPersonProtocol.h"
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, addPersonProtocol>

@end
