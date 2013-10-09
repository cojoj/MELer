//
//  ChapterViewController.m
//  MELer
//
//  Created by Mateusz Zając on 06.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "ChapterViewController.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.delegate = [[UIApplication sharedApplication]delegate];
    self.context = [self.delegate managedObjectContext];
    self.MELs = [NSArray arrayWithArray:[self fetchMELEntityWithContext:self.context]];

    NSLog(@"Size of the array: %lu", (unsigned long)[self.MELs count]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.MELs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Initializing Cell and filling it with info
    Chapter *chapter = [self.MELs objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Number: %@ \t Sections: %lu", chapter.number, (unsigned long)[chapter.sections count]];
    cell.textLabel.text = chapter.title;
    
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
        NSLog(@"%@: %@ (%lu)", chapter.number, chapter.title, (unsigned long)[chapter.sections count]);
    }
    
    return fetchedObjects;
}

@end
