//
//  STAAmenities.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"

@interface STAAmenities : STAObject

@property(nonatomic, assign) BOOL       restaurant;
@property(nonatomic, assign) BOOL       bar;
@property(nonatomic, assign) BOOL       coffee;
@property(nonatomic, assign) BOOL       biz;
@property(nonatomic, assign) BOOL       swim;
@property(nonatomic, assign) BOOL       internet;
@property(nonatomic, assign) BOOL       creditCard;
@property(nonatomic, assign) BOOL       laundry;
@property(nonatomic, assign) BOOL       pickupAndDrop;
@property(nonatomic, assign) BOOL       healthClub;
@property(nonatomic, assign) BOOL       freeNewspaper;
@property(nonatomic, assign) BOOL       elevator;
@property(nonatomic, assign) BOOL       pureVeg;
@property(nonatomic, assign) BOOL       parking;
@property(nonatomic, assign) BOOL       twenty4HourCheckIn;
@property(nonatomic, assign) BOOL       twenty4HourCheckOut;


-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
