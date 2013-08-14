//
//  Person.h
//  AddressBookCoreData
//
//  Created by alexchoi1 on 8/7/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * emailAddress;
@property (nonatomic, retain) NSSet *addresses;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addAddressesObject:(Address *)value;
- (void)removeAddressesObject:(Address *)value;
- (void)addAddresses:(NSSet *)values;
- (void)removeAddresses:(NSSet *)values;

@end
