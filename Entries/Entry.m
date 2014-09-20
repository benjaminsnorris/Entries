//
//  Entry.m
//  Entries
//
//  Created by Ben Norris on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "Entry.h"

#define titleKey @"title"
#define textKey @"text"
#define dateKey @"date"

@interface Entry()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *datestamp;

@end

@implementation Entry

- (NSDictionary *)entryDictionary {
    
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    if (self.title) [mutableDictionary setValue:self.title forKey:titleKey];
    if (self.text) [mutableDictionary setValue:self.text forKey:textKey];
    if (self.datestamp) [mutableDictionary setValue:self.datestamp forKey:dateKey];
    
    return mutableDictionary;
}

- (id)initWithDictionary: (NSDictionary *)dictionary {
    
    self.title = [dictionary objectForKey:titleKey];
    self.text = [dictionary objectForKey:textKey];
    self.datestamp = [dictionary objectForKey:dateKey];
    
    return self;
}

@end
