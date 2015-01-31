//
//  SHPRooms.h
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SHPRooms : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger roomID;
@property (nonatomic, strong) NSString *roomType;
@property (nonatomic, assign) double roomTariffDisplay;
@property (nonatomic, assign) double roomDiscount;
@property (nonatomic, assign) double roomDiscountDisplay;
@property (nonatomic, assign) double roomDiscountPriceWithTax;
@property (nonatomic, assign) NSInteger roomOccupants;
@property (nonatomic, assign) NSInteger totalnoofrooms;
@property (nonatomic, assign) BOOL isExtraBedType;
@property (nonatomic, assign) double tax;
@property (nonatomic, assign) double withTax;
@property (nonatomic, assign) double rate999;
@property (nonatomic, assign) double rate9;
@property (nonatomic, assign) BOOL isICHRoom;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
