//
//  SHPHotelLists.m
//
//  Created by gokul krishnan on 1/31/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SHPHotelLists.h"
#import "SHPContext.h"
#import "SHPHotels.h"
#import "SHPMetadata.h"


NSString *const kSHPHotelListsContext = @"context";
NSString *const kSHPHotelListsHotels = @"hotels";
NSString *const kSHPHotelListsMetadata = @"metadata";


@interface SHPHotelLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHPHotelLists

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
            self.context = [SHPContext modelObjectWithDictionary:[dict objectForKey:kSHPHotelListsContext]];
    NSObject *receivedSHPHotels = [dict objectForKey:kSHPHotelListsHotels];
    NSMutableArray *parsedSHPHotels = [NSMutableArray array];
    if ([receivedSHPHotels isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSHPHotels) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSHPHotels addObject:[SHPHotels modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSHPHotels isKindOfClass:[NSDictionary class]]) {
       [parsedSHPHotels addObject:[SHPHotels modelObjectWithDictionary:(NSDictionary *)receivedSHPHotels]];
    }

    self.hotels = [NSArray arrayWithArray:parsedSHPHotels];
            self.metadata = [SHPMetadata modelObjectWithDictionary:[dict objectForKey:kSHPHotelListsMetadata]];

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
    
    _context = nil;
    _hotels = nil;
    _metadata = nil;
}

@end
