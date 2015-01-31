//
//  SHPGeoCoordinates.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPGeoCoordinates.h"


NSString *const kSHPGeoCoordinatesLat = @"lat";
NSString *const kSHPGeoCoordinatesLng = @"lng";


@interface SHPGeoCoordinates ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPGeoCoordinates

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
            self.latitude = [[self objectOrNilForKey:kSHPGeoCoordinatesLat fromDictionary:dict] doubleValue];
            self.longitude = [[self objectOrNilForKey:kSHPGeoCoordinatesLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


@end
