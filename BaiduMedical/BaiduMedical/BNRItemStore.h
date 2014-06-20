//
//  BNRItemStore.h
//  Homepwner
//
//  Created by zhengyajun on 5/1/14.
//  Copyright (c) 2014 zhengyajun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

+ (BNRItemStore *)sharedStore;
- (NSArray *)allItems;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(int)from toIndex:(int)to;

- (NSString *)itemArchivePath;
- (BOOL)saveChanges;
@end
