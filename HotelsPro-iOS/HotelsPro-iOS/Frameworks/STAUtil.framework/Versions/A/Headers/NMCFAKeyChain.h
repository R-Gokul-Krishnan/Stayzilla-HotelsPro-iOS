//
//  NMCFAKeyChain.h
//  NMCFA
//
//  Created by vijayaragavan on 31/07/14.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMCFAKeyChain : NSObject

+ (void)setSecret:(NSString *)secret forKey:(NSString *)key;
+ (NSString *)secretForKey:(NSString *)key;
+ (void)removeSecretForKey:(NSString *)key;
+ (void)removeAllSecrets;
@end
