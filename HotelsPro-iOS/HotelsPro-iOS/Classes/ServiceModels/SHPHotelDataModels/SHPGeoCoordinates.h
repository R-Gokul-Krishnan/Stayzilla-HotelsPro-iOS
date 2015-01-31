//
//  SHPGeoCoordinates.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;



@interface SHPGeoCoordinates : NSObject

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
