//
//  AddressBookSingleton.m
//  AddressBookCoreData
//
//  Created by alexchoi1 on 8/8/13.
//  Copyright (c) 2013 Good Time Games. All rights reserved.
//

#import "AddressBookSingleton.h"

@implementation AddressBookSingleton
@synthesize managedObjectContext, persistentStoreCoordinator, managedObjectModel;
static AddressBookSingleton * sMySingleton;

+ (AddressBookSingleton *) sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sMySingleton = [[AddressBookSingleton alloc] init];
    });
    
    return sMySingleton;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        
        [self coreDataSetup];
        
    }
    return self;
}

-(void) coreDataSetup
{
    NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL * modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSURL *sqliteURL = [documentsDirectory URLByAppendingPathComponent:@"Model.sqlite"];
    NSError * error;
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    if ([persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:&error])
    {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    NSLog(@"%@",documentsDirectory.path);
    NSLog(@"appdelegate persistent store coordinator error%@",error);
    NSLog(@"coredata setup");
}

- (id) newObjectForEntityForName: (NSString *) name
{
    
    NSEntityDescription * description = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:managedObjectContext];
    
    return description;
    
}

- (NSArray *) fetchFromCoreData
{
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    NSFetchedResultsController * fetchedResultsController;
    NSError * error;
    NSSortDescriptor * sortDescriptor;
    NSArray * sortedDescriptors;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    sortedDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setEntity: entityDescription];
    [fetchRequest setSortDescriptors:sortedDescriptors];
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [fetchedResultsController performFetch:&error];
    
    if (fetchedResultsController.fetchedObjects == nil)
    {
        NSLog(@"WE HAVE PROBRAM %@", error);
        return @[];
    }
    else
    {
        return fetchedResultsController.fetchedObjects;
    }
}

- (void) saveToCoreData
{
    NSError * error;
    if([managedObjectContext save:&error])
    {
        NSLog(@"error: %@", error.userInfo);
    }
}


@end
