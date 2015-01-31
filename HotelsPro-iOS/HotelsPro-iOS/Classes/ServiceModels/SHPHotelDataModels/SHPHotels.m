//
//  SHPHotels.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPHotels.h"
#import "SHPExtraInfo.h"
#import "SHPRooms.h"
#import "SHPGeoCoordinates.h"
#import "SHPAmenities.h"
#import "SHPDistanceFrom.h"


NSString *const kSHPHotelsStayType = @"stayType";
NSString *const kSHPHotelsDayRoomAvailable = @"dayRoomAvailable";
NSString *const kSHPHotelsDisplayName = @"displayName";
NSString *const kSHPHotelsCity = @"city";
NSString *const kSHPHotelsName = @"name";
NSString *const kSHPHotelsRawPrice = @"rawPrice";
NSString *const kSHPHotelsIsICH = @"isICH";
NSString *const kSHPHotelsImageURL = @"imageURL";
NSString *const kSHPHotelsId = @"id";
NSString *const kSHPHotelsCustpickOrder = @"custpickOrder";
NSString *const kSHPHotelsInfo = @"info";
NSString *const kSHPHotelsDistanceFromLatLong = @"distanceFromLatLong";
NSString *const kSHPHotelsRooms = @"rooms";
NSString *const kSHPHotelsGeoCoordinates = @"geoCoordinates";
NSString *const kSHPHotelsAmenities = @"amenities";
NSString *const kSHPHotelsStarRating = @"starRating";
NSString *const kSHPHotelsGallery = @"gallery";
NSString *const kSHPHotelsPrice = @"price";
NSString *const kSHPHotelsDistanceFrom = @"distanceFrom";
NSString *const kSHPHotelsAddress = @"address";
NSString *const kSHPHotelsBookings = @"bookings";


@interface SHPHotels ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPHotels

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
            self.stayType = [[self objectOrNilForKey:kSHPHotelsStayType fromDictionary:dict] doubleValue];
            self.dayRoomAvailable = [[self objectOrNilForKey:kSHPHotelsDayRoomAvailable fromDictionary:dict] boolValue];
            self.displayName = [self objectOrNilForKey:kSHPHotelsDisplayName fromDictionary:dict];
            self.city = [self objectOrNilForKey:kSHPHotelsCity fromDictionary:dict];
            self.name = [self objectOrNilForKey:kSHPHotelsName fromDictionary:dict];
            self.rawPrice = [[self objectOrNilForKey:kSHPHotelsRawPrice fromDictionary:dict] doubleValue];
            self.isICH = [[self objectOrNilForKey:kSHPHotelsIsICH fromDictionary:dict] boolValue];
            self.imageURL = [self objectOrNilForKey:kSHPHotelsImageURL fromDictionary:dict];
            self.hotelsIdentifier = [[self objectOrNilForKey:kSHPHotelsId fromDictionary:dict] integerValue];
            self.custpickOrder = [[self objectOrNilForKey:kSHPHotelsCustpickOrder fromDictionary:dict] doubleValue];
            self.extraInfo = [SHPExtraInfo modelObjectWithDictionary:[dict objectForKey:kSHPHotelsInfo]];
            self.distanceFromLatLong = [[self objectOrNilForKey:kSHPHotelsDistanceFromLatLong fromDictionary:dict] doubleValue];
    NSObject *receivedSHPRooms = [dict objectForKey:kSHPHotelsRooms];
    NSMutableArray *parsedSHPRooms = [NSMutableArray array];
    if ([receivedSHPRooms isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSHPRooms) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSHPRooms addObject:[SHPRooms modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSHPRooms isKindOfClass:[NSDictionary class]]) {
       [parsedSHPRooms addObject:[SHPRooms modelObjectWithDictionary:(NSDictionary *)receivedSHPRooms]];
    }

    self.availableRoomsArray = [NSArray arrayWithArray:parsedSHPRooms];
            self.geoCoordinates = [SHPGeoCoordinates modelObjectWithDictionary:[dict objectForKey:kSHPHotelsGeoCoordinates]];
            self.amenities = [SHPAmenities modelObjectWithDictionary:[dict objectForKey:kSHPHotelsAmenities]];
            self.starRating = [[self objectOrNilForKey:kSHPHotelsStarRating fromDictionary:dict] doubleValue];
            self.galleryImagesArray = [self objectOrNilForKey:kSHPHotelsGallery fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kSHPHotelsPrice fromDictionary:dict] doubleValue];
            self.distanceFrom = [SHPDistanceFrom modelObjectWithDictionary:[dict objectForKey:kSHPHotelsDistanceFrom]];
            self.address = [self objectOrNilForKey:kSHPHotelsAddress fromDictionary:dict];
            self.bookings = [[self objectOrNilForKey:kSHPHotelsBookings fromDictionary:dict] doubleValue];

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
    
    _name = nil;
    _displayName = nil;
    _address = nil;
    _city = nil;
    _imageURL = nil;
    _galleryImagesArray = nil;
    _availableRoomsArray = nil;
    _geoCoordinates = nil;
    _distanceFrom = nil;
    _extraInfo = nil;
    _amenities = nil;
}

@end
