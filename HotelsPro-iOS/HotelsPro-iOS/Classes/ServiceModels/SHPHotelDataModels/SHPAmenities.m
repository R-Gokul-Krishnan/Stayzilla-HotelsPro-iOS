//
//  SHPAmenities.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPAmenities.h"


NSString *const kSHPAmenitiesTwenty4HourCheckIn = @"twenty4HourCheckIn";
NSString *const kSHPAmenitiesBar = @"bar";
NSString *const kSHPAmenitiesInternet = @"internet";
NSString *const kSHPAmenitiesParking = @"parking";
NSString *const kSHPAmenitiesTwenty4HourCheckOut = @"twenty4HourCheckOut";
NSString *const kSHPAmenitiesElevator = @"elevator";
NSString *const kSHPAmenitiesPickupAndDrop = @"pickupAndDrop";
NSString *const kSHPAmenitiesFreeNewspaper = @"freeNewspaper";
NSString *const kSHPAmenitiesCreditCard = @"creditCard";
NSString *const kSHPAmenitiesSwim = @"swim";
NSString *const kSHPAmenitiesRestaurant = @"restaurant";
NSString *const kSHPAmenitiesCoffee = @"coffee";
NSString *const kSHPAmenitiesBiz = @"biz";
NSString *const kSHPAmenitiesLaundry = @"laundry";
NSString *const kSHPAmenitiesHealthClub = @"healthClub";
NSString *const kSHPAmenitiesPureVeg = @"pureVeg";


@interface SHPAmenities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPAmenities

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
            self.twenty4HourCheckIn = [[self objectOrNilForKey:kSHPAmenitiesTwenty4HourCheckIn fromDictionary:dict] boolValue];
            self.bar = [[self objectOrNilForKey:kSHPAmenitiesBar fromDictionary:dict] boolValue];
            self.internet = [[self objectOrNilForKey:kSHPAmenitiesInternet fromDictionary:dict] boolValue];
            self.parking = [[self objectOrNilForKey:kSHPAmenitiesParking fromDictionary:dict] boolValue];
            self.twenty4HourCheckOut = [[self objectOrNilForKey:kSHPAmenitiesTwenty4HourCheckOut fromDictionary:dict] boolValue];
            self.elevator = [[self objectOrNilForKey:kSHPAmenitiesElevator fromDictionary:dict] boolValue];
            self.pickupAndDrop = [[self objectOrNilForKey:kSHPAmenitiesPickupAndDrop fromDictionary:dict] boolValue];
            self.freeNewspaper = [[self objectOrNilForKey:kSHPAmenitiesFreeNewspaper fromDictionary:dict] boolValue];
            self.creditCard = [[self objectOrNilForKey:kSHPAmenitiesCreditCard fromDictionary:dict] boolValue];
            self.swim = [[self objectOrNilForKey:kSHPAmenitiesSwim fromDictionary:dict] boolValue];
            self.restaurant = [[self objectOrNilForKey:kSHPAmenitiesRestaurant fromDictionary:dict] boolValue];
            self.coffee = [[self objectOrNilForKey:kSHPAmenitiesCoffee fromDictionary:dict] boolValue];
            self.biz = [[self objectOrNilForKey:kSHPAmenitiesBiz fromDictionary:dict] boolValue];
            self.laundry = [[self objectOrNilForKey:kSHPAmenitiesLaundry fromDictionary:dict] boolValue];
            self.healthClub = [[self objectOrNilForKey:kSHPAmenitiesHealthClub fromDictionary:dict] boolValue];
            self.pureVeg = [[self objectOrNilForKey:kSHPAmenitiesPureVeg fromDictionary:dict] boolValue];

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
