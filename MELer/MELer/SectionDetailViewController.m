//
//  SectionDetailViewController.m
//  MELer
//
//  Created by Mateusz Zając on 13.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "SectionDetailViewController.h"

@interface SectionDetailViewController ()

@end

@implementation SectionDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setting titles
    [self.chapterTitleTextField setText:self.chapter.title];
    [self.sectionTitleTextField setText:[self.section.title capitalizedString]];
    [self.numberTextField setText:[NSString stringWithFormat:@"%@-%@", self.chapter.number, self.section.number]];
    
    // Setting details
    [self.detailTextView setText:[self displayProperDescriptionBasedOn:self.section.details]];
    [self.detailTextView sizeToFit];
    [self.detailTextView layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

// Method for generating and returning proper NSString based on content of details
- (NSString *)displayProperDescriptionBasedOn:(NSString *)description
{
    NSString *properDescription = description;
    
    if ([description isEqualToString:@""]) {
        properDescription = @"No description for this section";
    }
    
    return properDescription;
}

@end
