//
//  MasterViewController.m
//  MELer
//
//  Created by Mateusz Zając on 14.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initializing properties with data
    self.delegate = [[UIApplication sharedApplication]delegate];
    self.context = [self.delegate managedObjectContext];
    self.MELs = [NSArray arrayWithArray:[self fetchMELEntityWithContext:self.context]];
    
    NSLog(@"Size of the array: %i", [self.MELs count]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Test fetch request

// Test fetch for developing purposes
- (NSArray *)fetchMELEntityWithContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Chapter"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:descriptor]];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:nil];
    
    for (Chapter *chapter in fetchedObjects) {
        NSLog(@"%@: %@ (%i)", chapter.number, chapter.title, [chapter.sections count]);
    }
    
    return fetchedObjects;
}

@end
