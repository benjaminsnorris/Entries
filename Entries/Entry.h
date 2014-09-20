//
//  Entry.h
//  Entries
//
//  Created by Ben Norris on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

- (NSDictionary *)entryDictionary;
- (id)initWithDictionary: (NSDictionary *)dictionary;

@end
