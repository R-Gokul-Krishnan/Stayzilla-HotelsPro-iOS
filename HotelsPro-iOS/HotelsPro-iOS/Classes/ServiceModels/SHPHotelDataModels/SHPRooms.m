//
//  SHPRooms.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPRooms.h"


NSString *const kSHPRoomsRoccupants = @"roccupants";
NSString *const kSHPRoomsIsExtraBedType = @"isExtraBedType";
NSString *const kSHPRoomsTax = @"tax";
NSString *const kSHPRoomsTotalnoofrooms = @"totalnoofrooms";
NSString *const kSHPRoomsWithTax = @"withTax";
NSString *const kSHPRoomsRdiscountPriceWithTax = @"rdiscountPriceWithTax";
NSString *const kSHPRoomsRdiscount = @"rdiscount";
NSString *const kSHPRoomsRid = @"rid";
NSString *const kSHPRoomsRate999 = @"rate999";
NSString *const kSHPRoomsIsICHRoom = @"isICHRoom";
NSString *const kSHPRoomsRtariffDisp = @"rtariffDisp";
NSString *const kSHPRoomsRtype = @"rtype";
NSString *const kSHPRoomsRdiscountDisp = @"rdiscountDisp";
NSString *const kSHPRoomsRate9 = @"rate9";


@interface SHPRooms ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPRooms

@synthesize roomOccupants = _roomOccupants;
@synthesize isExtraBedType = _isExtraBedType;
@synthesize tax = _tax;
@synthesize totalnoofrooms = _totalnoofrooms;
@synthesize withTax = _withTax;
@synthesize roomDiscountPriceWithTax = _roomDiscountPriceWithTax;
@synthesize roomDiscount = _roomDiscount;
@synthesize roomID = _roomID;
@synthesize rate999 = _rate999;
@synthesize isICHRoom = _isICHRoom;
@synthesize roomTariffDisplay = _roomTariffDisplay;
@synthesize roomType = _roomType;
@synthesize roomDiscountDisplay = _roomDiscountDisplay;
@synthesize rate9 = _rate9;


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
            self.roomOccupants = [[self objectOrNilForKey:kSHPRoomsRoccupants fromDictionary:dict] integerValue];
            self.isExtraBedType = [[self objectOrNilForKey:kSHPRoomsIsExtraBedType fromDictionary:dict] boolValue];
            self.tax = [[self objectOrNilForKey:kSHPRoomsTax fromDictionary:dict] doubleValue];
            self.totalnoofrooms = [[self objectOrNilForKey:kSHPRoomsTotalnoofrooms fromDictionary:dict] integerValue];
            self.withTax = [[self objectOrNilForKey:kSHPRoomsWithTax fromDictionary:dict] doubleValue];
            self.roomDiscountPriceWithTax = [[self objectOrNilForKey:kSHPRoomsRdiscountPriceWithTax fromDictionary:dict] doubleValue];
            self.roomDiscount = [[self objectOrNilForKey:kSHPRoomsRdiscount fromDictionary:dict] doubleValue];
            self.roomID = [[self objectOrNilForKey:kSHPRoomsRid fromDictionary:dict] integerValue];
            self.rate999 = [[self objectOrNilForKey:kSHPRoomsRate999 fromDictionary:dict] doubleValue];
            self.isICHRoom = [[self objectOrNilForKey:kSHPRoomsIsICHRoom fromDictionary:dict] boolValue];
            self.roomTariffDisplay = [[self objectOrNilForKey:kSHPRoomsRtariffDisp fromDictionary:dict] doubleValue];
            self.roomType = [self objectOrNilForKey:kSHPRoomsRtype fromDictionary:dict];
            self.roomDiscountDisplay = [[self objectOrNilForKey:kSHPRoomsRdiscountDisp fromDictionary:dict] doubleValue];
            self.rate9 = [[self objectOrNilForKey:kSHPRoomsRate9 fromDictionary:dict] doubleValue];

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
    
    _roomType = nil;
}

@end
