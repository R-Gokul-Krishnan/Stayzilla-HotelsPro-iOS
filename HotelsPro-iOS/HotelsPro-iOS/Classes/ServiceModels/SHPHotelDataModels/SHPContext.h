//
//  SHPContext.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015. All rights reserved.
//

@import Foundation;

@interface SHPContext : NSObject

@property (nonatomic, copy) NSString *checkinTime;
@property (nonatomic, copy) NSString *checkoutTime;
@property (nonatomic, copy) NSString *cityName;

@property (nonatomic, assign) BOOL latLongSearch;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double locationId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
