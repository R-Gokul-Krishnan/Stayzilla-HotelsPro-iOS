//
//  NSString+Date.h
//  NMCFAUtil
//
//  Created by vijayaragavan on 01/07/13.
//  Copyright (c) 2013 photon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Utils)


- (NSString *)encodeString:(NSStringEncoding)encoding;
- (NSString *)stringDateFormatChange:(NSString *)sFormat;
- (NSDate *)asDate;
- (BOOL)monthValidation;


@end
