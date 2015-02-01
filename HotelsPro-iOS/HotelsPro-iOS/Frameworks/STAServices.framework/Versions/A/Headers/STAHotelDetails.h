//
//  STAHotelDetails.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"

@interface STAHotelDetails : STAObject

@property(nonatomic, copy) NSString *locationId;
@property(nonatomic, copy) NSString *location;
@property(nonatomic, copy) NSString *checkIn;
@property(nonatomic, copy) NSString *checkOut;
@property(nonatomic, copy) NSString *propertyType;
@property(nonatomic, copy) NSMutableArray *hotels;

@property(nonatomic, assign) BOOL latLongSearch;
@property(nonatomic, copy) NSNumber *lat;
@property(nonatomic, copy) NSNumber *lng;
@property(nonatomic, copy) NSNumber *noOfHotels;
@property(nonatomic, copy) NSNumber *minAdvanceDays;
@property(nonatomic, copy) NSNumber *soldoutPer;


-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
