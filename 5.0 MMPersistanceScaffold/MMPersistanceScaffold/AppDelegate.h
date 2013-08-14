//
//  AppDelegate.h
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectModel * managedObjectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;

@end
