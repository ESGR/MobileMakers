//
//  addPersonProtocol.h
//  AddressBook
//
//  Created by alexchoi1 on 7/22/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@protocol addPersonProtocol <NSObject>
-(Person *) modifyPerson: (Person *) personv withFirstName: (NSString *) first lastName: (NSString *) last email: (NSString *) email phoneNumber: (NSString *) phone;
-(void) refreshData;
@end
