//
//  SHPHotels.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

@import Foundation;

@class SHPExtraInfo, SHPGeoCoordinates, SHPAmenities, SHPDistanceFrom;

@interface SHPHotels : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *displayName;

@property (nonatomic, assign) double stayType;

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *city;

@property (nonatomic, assign) NSInteger hotelsIdentifier;

@property (nonatomic, assign) double price;
@property (nonatomic, assign) double rawPrice;

@property (nonatomic, copy) NSString *imageURL;

@property (nonatomic, copy) NSArray *galleryImagesArray;
@property (nonatomic, copy) NSArray *availableRoomsArray;

@property (nonatomic, copy) SHPGeoCoordinates *geoCoordinates;
@property (nonatomic, copy) SHPDistanceFrom *distanceFrom;
@property (nonatomic, copy) SHPExtraInfo *extraInfo;
@property (nonatomic, copy) SHPAmenities *amenities;

@property (nonatomic, assign) double starRating;
@property (nonatomic, assign) double custpickOrder;
@property (nonatomic, assign) double distanceFromLatLong;

@property (nonatomic, assign) BOOL dayRoomAvailable;
@property (nonatomic, assign) BOOL isICH;

@property (nonatomic, assign) double bookings;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
