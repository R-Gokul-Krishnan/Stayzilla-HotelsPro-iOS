//
//  SHPChkout.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;

@interface SHPCheckOutTimings : NSObject

@property (nonatomic, strong) NSString *minutes;
@property (nonatomic, strong) NSString *hours;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
