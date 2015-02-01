//
//  STARoom.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"

@interface STARoom : STAObject

@property(nonatomic, strong) NSString *rid;
@property(nonatomic, strong) NSString *rtype;
@property(nonatomic, strong) NSString *rtariffDisp;
@property(nonatomic, strong) NSString *rdiscount;
@property(nonatomic, strong) NSString *rdiscountDisp;
@property(nonatomic, strong) NSString *rdiscountPriceWithTax;
@property(nonatomic, strong) NSString *roccupants;
@property(nonatomic, strong) NSString *totalnoofrooms;
@property(nonatomic, assign) BOOL     isExtraBedType;
@property(nonatomic, strong) NSNumber *withTax;
@property(nonatomic, strong) NSNumber *tax;
@property(nonatomic, strong) NSNumber *rate999;
@property(nonatomic, strong) NSNumber *rate9;
@property(nonatomic, assign) BOOL      isICHRoom;



-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
