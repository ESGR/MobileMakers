//
//  AddressBookSingleton.h
//  AddressBookCoreData
//
//  Created by alexchoi1 on 8/8/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface AddressBookSingleton : NSObject
@property (strong, nonatomic) NSManagedObjectModel * managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;



+ (AddressBookSingleton *) sharedInstance;
- (id) newObjectForEntityForName: (NSString *) name;
- (NSArray *) fetchFromCoreData;
- (void) saveToCoreData;

@end
