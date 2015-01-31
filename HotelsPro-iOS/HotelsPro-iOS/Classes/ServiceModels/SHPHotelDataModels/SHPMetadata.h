//
//  SHPMetadata.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SHPMetadata : NSObject

@property (nonatomic, assign) double minimumAdvanceDays;
@property (nonatomic, assign) double soldoutPer;
@property (nonatomic, assign) double totalHotels;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
