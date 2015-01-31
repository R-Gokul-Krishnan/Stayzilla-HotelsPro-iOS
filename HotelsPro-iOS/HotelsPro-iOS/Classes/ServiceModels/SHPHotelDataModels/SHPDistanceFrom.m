//
//  SHPDistanceFrom.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPDistanceFrom.h"


NSString *const kSHPDistanceFromRailway = @"railway";
NSString *const kSHPDistanceFromAirportName = @"airportName";
NSString *const kSHPDistanceFromBusStand = @"busStand";
NSString *const kSHPDistanceFromRailwayStnName = @"railwayStnName";
NSString *const kSHPDistanceFromAirport = @"airport";
NSString *const kSHPDistanceFromBusStandName = @"busStandName";


@interface SHPDistanceFrom ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPDistanceFrom

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
            self.railway = [[self objectOrNilForKey:kSHPDistanceFromRailway fromDictionary:dict] doubleValue];
            self.airportName = [self objectOrNilForKey:kSHPDistanceFromAirportName fromDictionary:dict];
            self.busStand = [[self objectOrNilForKey:kSHPDistanceFromBusStand fromDictionary:dict] doubleValue];
            self.railwayStationName = [self objectOrNilForKey:kSHPDistanceFromRailwayStnName fromDictionary:dict];
            self.airport = [[self objectOrNilForKey:kSHPDistanceFromAirport fromDictionary:dict] doubleValue];
            self.busStandName = [self objectOrNilForKey:kSHPDistanceFromBusStandName fromDictionary:dict];

    }
    
    return self;
    
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - Dealloc

- (void)dealloc {
    
    _airportName = nil;
    _railwayStationName = nil;
    _busStandName = nil;
}

@end
