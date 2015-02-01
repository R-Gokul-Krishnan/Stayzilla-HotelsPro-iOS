//
//  STADistanceFrom.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"

@interface STADistanceFrom : STAObject

@property(nonatomic, strong) NSString *airport;
@property(nonatomic, strong) NSString *airportName;
@property(nonatomic, strong) NSString *railway;
@property(nonatomic, strong) NSString *railwayStnName;
@property(nonatomic, strong) NSString *busStand;
@property(nonatomic, strong) NSString *busStandName;




-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
