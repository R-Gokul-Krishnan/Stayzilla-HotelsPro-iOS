//
//  SHPHotelListingModel.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPHotelListingModel.h"
#import "SHPHotelLists.h"


NSString *const kSHPHotelListingModelHotelLists = @"HotelLists";


@interface SHPHotelListingModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPHotelListingModel


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.hotelLists = [SHPHotelLists modelObjectWithDictionary:[dict objectForKey:kSHPHotelListingModelHotelLists]];

    }
    
    return self;
    
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

- (void)dealloc {
    
    _hotelLists = nil;
}


@end
