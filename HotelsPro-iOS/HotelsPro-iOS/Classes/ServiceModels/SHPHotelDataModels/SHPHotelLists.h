//
//  SHPHotelLists.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;

@class SHPContext, SHPMetadata;

@interface SHPHotelLists : NSObject

@property (nonatomic, copy) SHPContext *context;
@property (nonatomic, copy) NSArray *hotels;
@property (nonatomic, copy) SHPMetadata *metadata;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
