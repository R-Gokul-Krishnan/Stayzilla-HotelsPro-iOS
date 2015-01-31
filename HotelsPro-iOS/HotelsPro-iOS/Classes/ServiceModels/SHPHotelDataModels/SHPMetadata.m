//
//  SHPMetadata.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPMetadata.h"


NSString *const kSHPMetadataMinAdvanceDays = @"minAdvanceDays";
NSString *const kSHPMetadataSoldoutPer = @"soldoutPer";
NSString *const kSHPMetadataNoOfHotels = @"noOfHotels";


@interface SHPMetadata ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPMetadata

@synthesize minimumAdvanceDays = _minimumAdvanceDays;
@synthesize soldoutPer = _soldoutPer;
@synthesize totalHotels = _totalHotels;


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
        
        self.minimumAdvanceDays = [[self objectOrNilForKey:kSHPMetadataMinAdvanceDays fromDictionary:dict] doubleValue];
        self.soldoutPer = [[self objectOrNilForKey:kSHPMetadataSoldoutPer fromDictionary:dict] doubleValue];
        self.totalHotels = [[self objectOrNilForKey:kSHPMetadataNoOfHotels fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

#pragma mark - Helper Method

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
