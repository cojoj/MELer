//
//  SectionDetailViewController.h
//  MELer
//
//  Created by Mateusz Zając on 13.10.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Section.h"
#import "Chapter.h"

@interface SectionDetailViewController : UIViewController

@property (strong, nonatomic) Chapter *chapter;
@property (strong, nonatomic) Section *section;
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;
@property (strong, nonatomic) IBOutlet UITextField *sectionTitleTextField;

@end
