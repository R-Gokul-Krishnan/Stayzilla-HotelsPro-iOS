//
//  SHPServiceLibrary.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "SHPServiceLibrary.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"http://180.92.168.7/";

@implementation SHPServiceLibrary

+ (instancetype)sharedClient {
    
    static SHPServiceLibrary *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SHPServiceLibrary alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
