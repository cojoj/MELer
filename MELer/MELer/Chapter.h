//
//  Chapter.h
//  MELer
//
//  Created by Mateusz Zając on 15.09.2013.
//  Copyright (c) 2013 Mateusz Zając. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Section;

@interface Chapter : NSManagedObject

@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSSet *sections;
@end

@interface Chapter (CoreDataGeneratedAccessors)

- (void)addSectionsObject:(Section *)value;
- (void)removeSectionsObject:(Section *)value;
- (void)addSections:(NSSet *)values;
- (void)removeSections:(NSSet *)values;

@end
