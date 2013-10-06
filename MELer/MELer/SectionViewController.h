//
//  SectionViewController.h
//  MELer
//
//  Created by Mateusz Zając on 06.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chapter.h"
#import "Section.h"

@interface SectionViewController : UITableViewController <UITableViewDataSource>

@property (strong, nonatomic) Chapter *chapter;

@end
