//
//  DetailViewController.m
//  MELer
//
//  Created by Mateusz Zając on 14.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", [self.chapter.sections description]);
}

@end
