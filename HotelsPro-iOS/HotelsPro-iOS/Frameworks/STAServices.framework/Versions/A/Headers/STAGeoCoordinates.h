//
//  STAGeoCoordinates.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import "STAObject.h"

@interface STAGeoCoordinates : STAObject

@property(nonatomic, strong) NSNumber *latitude;
@property(nonatomic, strong) NSNumber *langitude;




-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
