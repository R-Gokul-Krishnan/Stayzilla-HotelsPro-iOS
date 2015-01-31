//
//  SHPHotelListingModel.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;

@class SHPHotelLists;

@interface SHPHotelListingModel : NSObject

@property (nonatomic, copy) SHPHotelLists *hotelLists;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
