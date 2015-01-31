//
//  STAObject.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <STAUtil/STAUtil.h>
@interface STAObject : NSObject

@property (nonatomic, strong) NSNumber *responseCode;
@property (nonatomic, strong) NSString *responseDescription;
@property (nonatomic, strong) NSNumber *responseTag;
@property (nonatomic, strong) id payload;
@end
