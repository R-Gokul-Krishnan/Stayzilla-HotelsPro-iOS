//
//  STARequestHelper.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STAHotelDetails.h"

@interface STARequestHelper : NSObject


+(NSData*)getHotelDetailsData:(STAHotelDetails *)hotelDetails;
@end