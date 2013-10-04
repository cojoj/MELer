//
//  MasterViewController.h
//  MELer
//
//  Created by Mateusz Zając on 14.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Section.h"
#import "Chapter.h"

@interface MasterViewController : UITableViewController <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) AppDelegate *delegate;
@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSArray *MELs;

@end
