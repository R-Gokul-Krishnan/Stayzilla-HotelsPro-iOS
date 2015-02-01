//
//  STACheckInOutInfo.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"
#import "STATime.h"

@interface STACheckInOutInfo : STAObject

@property(nonatomic, strong) NSString *taxInfo;
@property(nonatomic, strong) STATime *checkOut;
@property(nonatomic, strong) STATime *checkIn;



-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
