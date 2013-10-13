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
    
    [self.navigationItem setTitle:self.section.title];
    // NSLog(@"chap: %@, sec: %@", self.chapter.title, self.section.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
