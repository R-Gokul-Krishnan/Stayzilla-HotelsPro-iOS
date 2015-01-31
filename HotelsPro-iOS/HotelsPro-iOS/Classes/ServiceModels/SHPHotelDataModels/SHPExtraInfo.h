//
//  SHPInfo.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;

@class SHPCheckInTimings, SHPCheckOutTimings;

@interface SHPExtraInfo : NSObject

@property (nonatomic, copy) SHPCheckInTimings *checkInTimings;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) SHPCheckOutTimings *checkoutTimings;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
