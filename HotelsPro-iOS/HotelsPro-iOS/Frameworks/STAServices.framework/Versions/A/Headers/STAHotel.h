//
//  STAHotel.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import "STAObject.h"
#import "STAGeoCoordinates.h"
#import "STADistanceFrom.h"
#import "STAAmenities.h"
#import "STACheckInOutInfo.h"

@interface STAHotel : STAObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *displayName;
@property(nonatomic, strong) NSNumber *stayType;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *hotelId;
@property(nonatomic, strong) NSString *price;
@property(nonatomic, strong) NSNumber *rawPrice;
@property(nonatomic, strong) NSString *imageURL;
@property(nonatomic, strong) NSString *starRating;
@property(nonatomic, strong) NSNumber *custpickOrder;
@property(nonatomic, strong) NSNumber *distanceFromLatLong;
@property(nonatomic, assign) BOOL      dayRoomAvailable;
@property(nonatomic, assign) BOOL      isICH;
@property(nonatomic, strong) NSNumber *bookings;
@property(nonatomic, strong) NSArray  *gallary;
@property(nonatomic, strong) NSMutableArray *rooms;

@property(nonatomic, strong) STAGeoCoordinates  *geoCoordinates;
@property(nonatomic, strong) STADistanceFrom    *disdanceFrom;
@property(nonatomic, strong) STAAmenities       *amenities;
@property(nonatomic, strong) STACheckInOutInfo  *chekInOutInfo;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
