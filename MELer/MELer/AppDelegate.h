//
//  AppDelegate.h
//  MELer
//
//  Created by Mateusz Zając on 14.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chapter.h"
#import "Section.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
