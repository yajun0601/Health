//
//  BNRItemStore.m
//  Homepwner
//
//  Created by zhengyajun on 5/1/14.
//  Copyright (c) 2014 zhengyajun. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@implementation BNRItemStore
- (id)init
{
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        NSLog(@"path: %@", path);
        allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!allItems) {
         allItems = [[NSMutableArray alloc] init];
        }
        else{
            NSLog(@"count: %d", [allItems count]);
        }
    }
    return self;
}


+ (BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if(!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}


- (NSArray *)allItems
{
    return allItems;
}
- (BNRItem *)createItem
{
    //BNRItem *p = [BNRItem randomItem];
    BNRItem *p = [[BNRItem alloc] init];
    [allItems addObject:p];
    return p;
}

- (void)removeItem:(BNRItem *)item
{
    NSString *key = [item imageKey];
    [[BNRImageStore sharedStroe]deleteImageForKey:key];
    [allItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    BNRItem *p = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"num of directories %lu", (unsigned long)[documentDirectories indexOfObject:[documentDirectories lastObject]] );
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSLog(@"directory: %@", documentDirectories);
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    NSLog(@" to --> %@", path);
    return [NSKeyedArchiver archiveRootObject:allItems toFile:path];
}

@end
