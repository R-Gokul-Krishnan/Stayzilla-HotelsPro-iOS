//
//  SHPInfo.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPExtraInfo.h"
#import "SHPCheckInTimings.h"
#import "SHPCheckOutTimings.h"


NSString *const kSHPInfoChkin = @"chkin";
NSString *const kSHPInfoIncl = @"incl";
NSString *const kSHPInfoChkout = @"chkout";


@interface SHPExtraInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPExtraInfo


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
            self.checkInTimings = [SHPCheckInTimings modelObjectWithDictionary:[dict objectForKey:kSHPInfoChkin]];
            self.notes = [self objectOrNilForKey:kSHPInfoIncl fromDictionary:dict];
            self.checkoutTimings = [SHPCheckOutTimings modelObjectWithDictionary:[dict objectForKey:kSHPInfoChkout]];

    }
    
    return self;
    
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

- (void)dealloc{
    
    _checkInTimings = nil;
    _notes = nil;
    _checkoutTimings = nil;
}

@end
