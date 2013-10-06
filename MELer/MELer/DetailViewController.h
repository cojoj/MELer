//
//  DetailViewController.h
//  MELer
//
//  Created by Mateusz Zając on 14.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chapter.h"
#import "Section.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Chapter *chapter;

@end
