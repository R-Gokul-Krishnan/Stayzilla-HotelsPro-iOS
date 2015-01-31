//
//  SHPDistanceFrom.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SHPDistanceFrom : NSObject

@property (nonatomic, assign) double airport;
@property (nonatomic, copy) NSString *airportName;
@property (nonatomic, assign) double railway;
@property (nonatomic, copy) NSString *railwayStationName;
@property (nonatomic, assign) double busStand;
@property (nonatomic, copy) NSString *busStandName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
