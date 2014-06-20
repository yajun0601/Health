//
//  BNRImageStore.m
//  Homepwner
//
//  Created by zhengyajun on 5/3/14.
//  Copyright (c) 2014 zhengyajun. All rights reserved.
//

#import "BNRImageStore.h"

@implementation BNRImageStore

- (id) init
{
    self = [super init];
    if (self) {
        dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStroe];
}

+ (BNRImageStore *)sharedStroe
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:NULL]init];
    }
    
    return sharedStore;
}
//////////////////////
- (void)setImage:(UIImage *)i forkey:(NSString *)s
{
    [dictionary setObject:i forKey:s];
    //NSLog(@"[%s]count: %d // currKey: %@", __PRETTY_FUNCTION__, [dictionary count], s);
    
    NSString *imgPath = [self imagePathForKey:s];
    NSLog(@"path: %@", imgPath);
    
    NSData *d;
//    if ([imgPath hasSuffix:@"png"] || [imgPath hasSuffix:@"PNG"]) {
//        d = UIImagePNGRepresentation(i);
//    }
//    else{
        d = UIImageJPEGRepresentation(i, 0.5);
//    }
    
    [d writeToFile:imgPath atomically:YES];
}
- (UIImage *)imageForKey:(NSString *)s
{
    NSLog(@"count: %lu // currKey: %@", (unsigned long)[dictionary count], s);
    UIImage *img = [dictionary objectForKey:s];
    
    if(!img){
        img = [UIImage imageWithContentsOfFile:[self imagePathForKey:s]];
        if (img) {
            [dictionary setObject:img forKey:s];
            
        }else{
            NSLog(@"Error, cannot find %@",[self imagePathForKey:s]);
        }
    }
    
    return img;
}

- (void)deleteImageForKey:(NSString *)s
{
    if (!s)
        return;
    {
        [dictionary removeObjectForKey:s];
    }
    
    NSString *path = [self imagePathForKey:s];
    [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];
}

- (NSString *)imagePathForKey:(NSString *)key
{
    NSArray *docDirectories =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"count: %lu",(unsigned long)[docDirectories count]);
    
    NSString *docDirectory = [docDirectories objectAtIndex:0];
    return [docDirectory stringByAppendingPathComponent:key];
}
@end
