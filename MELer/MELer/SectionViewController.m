//
//  SectionViewController.m
//  MELer
//
//  Created by Mateusz Zając on 09.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "SectionViewController.h"
#import "SectionDetailViewController.h"

@interface SectionViewController ()

@end

@implementation SectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Sorting array of sections in ascending order
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES];
    self.sectionsArray = [NSArray arrayWithArray:[[self.chapter.sections allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]]];
    
    // Setting details and fitting its content to fit text view
    [self.chapterDetailTextView setText:self.chapter.details];
    [self.chapterDetailTextView sizeToFit];
    [self.chapterDetailTextView layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // We have only one section because we're inside the chapter
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // We have as many rows as the array has fields
    return [self.chapter.sections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Creating an instance and setting cell labels
    Section *section = [self.sectionsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [section.title capitalizedString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Number: %@", section.number];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Passing the proper data to section detail view controller
    if ([[segue identifier] isEqualToString:@"sectionDetailsSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SectionDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.chapter = self.chapter;
        destinationViewController.section = [self.sectionsArray objectAtIndex:indexPath.row];
    }
}

@end
