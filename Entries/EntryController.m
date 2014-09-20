//
//  EntryController.m
//  Entries
//
//  Created by Ben Norris on 9/20/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"

#define entryListKey @"entryList"

@interface EntryController()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)addEntry:(Entry *)entry {
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    self.entries = mutableEntries;
    
    [self synchronize];
}

- (void)removeEntry:(Entry *)entry {
    if (!entry || !self.entries) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    self.entries = mutableEntries;
    
    [self synchronize];
}

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry {
    if (!oldEntry || !newEntry || !self.entries) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    if ([mutableEntries containsObject:oldEntry]) {
        [mutableEntries replaceObjectAtIndex:[mutableEntries indexOfObject:oldEntry] withObject:newEntry];
    }
    self.entries = mutableEntries;
    
    [self synchronize];
}

- (void)loadFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }
    self.entries = entries;
}

- (void)synchronize {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
