//
//  SHPContext.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPContext.h"


NSString *const kSHPContextCheckout = @"checkout";
NSString *const kSHPContextCity = @"city";
NSString *const kSHPContextCheckin = @"checkin";
NSString *const kSHPContextLatLongSearch = @"latLongSearch";
NSString *const kSHPContextLng = @"lng";
NSString *const kSHPContextLat = @"lat";
NSString *const kSHPContextLocationId = @"locationId";


@interface SHPContext ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPContext

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
        
            self.checkoutTime = [self objectOrNilForKey:kSHPContextCheckout fromDictionary:dict];
            self.cityName = [self objectOrNilForKey:kSHPContextCity fromDictionary:dict];
            self.checkinTime = [self objectOrNilForKey:kSHPContextCheckin fromDictionary:dict];
            self.latLongSearch = [[self objectOrNilForKey:kSHPContextLatLongSearch fromDictionary:dict] boolValue];
            self.longitude = [[self objectOrNilForKey:kSHPContextLng fromDictionary:dict] doubleValue];
            self.latitude = [[self objectOrNilForKey:kSHPContextLat fromDictionary:dict] doubleValue];
            self.locationId = [[self objectOrNilForKey:kSHPContextLocationId fromDictionary:dict] doubleValue];
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
    
    [self setCheckoutTime:nil];
    [self setCheckinTime:nil];
    [self setCityName:nil];
}


@end
