//
//  BNRImageStore.h
//  Homepwner
//
//  Created by zhengyajun on 5/3/14.
//  Copyright (c) 2014 zhengyajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (BNRImageStore *) sharedStroe;

- (void)setImage:(UIImage *)i forkey:(NSString *)s;
- (UIImage *)imageForKey:(NSString *)s;
- (void)deleteImageForKey:(NSString *)s;
- (NSString *)imagePathForKey:(NSString *)key;
@end
