//
//  STATime.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "STAObject.h"

@interface STATime : STAObject

@property(nonatomic, strong) NSString *hour;
@property(nonatomic, strong) NSString *minitue;




-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
