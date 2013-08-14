//
//  Address.h
//  AddressBookCoreData
//
//  Created by alexchoi1 on 8/7/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Address : NSManagedObject

@property (nonatomic, retain) NSString * streetAddress;
@property (nonatomic, retain) NSString * addressType;
@property (nonatomic, retain) NSSet *persons;
@end

@interface Address (CoreDataGeneratedAccessors)

- (void)addPersonsObject:(Person *)value;
- (void)removePersonsObject:(Person *)value;
- (void)addPersons:(NSSet *)values;
- (void)removePersons:(NSSet *)values;

@end
