//
//  EntryController.h
//  Entries
//
//  Created by Ben Norris on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry;

@end
