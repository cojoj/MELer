//
//  ChapterViewController.m
//  MELer
//
//  Created by Mateusz Zając on 06.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "ChapterViewController.h"
#import "SectionViewController.h"
#import "DetailViewController.h"

@interface ChapterViewController ()

@end

@implementation ChapterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initializing properties with data
    self.delegate = [[UIApplication sharedApplication]delegate];
    self.context = [self.delegate managedObjectContext];
    self.MELs = [NSArray arrayWithArray:[self fetchMELEntityWithContext:self.context]];
    
    NSLog(@"Size of the array: %lu", (unsigned long)[self.MELs count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    Chapter *chapter = [self.MELs objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Number: %@ \t Sections: %lu", chapter.number, (unsigned long)[chapter.sections count]];
    cell.textLabel.text = chapter.title;

    
    if ([chapter.sections count] != 0) {
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    } else {
        if ([chapter.details isEqualToString:@""]) {
            [cell setUserInteractionEnabled:NO];
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        } else {
            // Need something to deactivate cell but leave detail button active
            [cell setAccessoryType:UITableViewCellAccessoryDetailButton];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Prepare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    SectionViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.chapter = [self.MELs objectAtIndex:indexPath.row];
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
