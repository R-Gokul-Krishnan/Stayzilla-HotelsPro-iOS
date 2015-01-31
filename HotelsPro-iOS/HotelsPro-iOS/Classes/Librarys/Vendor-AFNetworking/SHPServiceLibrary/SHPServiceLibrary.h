//
//  SHPServiceLibrary.h
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "AFHTTPSessionManager.h"

@interface SHPServiceLibrary : AFHTTPSessionManager

+ (instancetype)sharedClient;

//- (void)getHotelsList:


@end
