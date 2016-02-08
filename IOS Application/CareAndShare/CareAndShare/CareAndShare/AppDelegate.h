//
//  AppDelegate.h
//  CareAndShare
//
//  Created by Mihail Karev on 1/25/16.
//  Copyright © 2016 Accedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) PFObject *myParseObject;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

