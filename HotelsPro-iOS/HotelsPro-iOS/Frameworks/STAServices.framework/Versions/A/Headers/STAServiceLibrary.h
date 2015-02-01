//
//  STAServiceLibrary.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STAObject.h"
#import "STAHotelDetails.h"

@protocol STAServiceLibraryDelegate <NSObject>
@required
- (void)didReceiveResponse:(STAObject *)response;
- (void)didReceiveError:(STAObject *)errorresponse;
@end

@interface STAServiceLibrary : NSObject

@property (nonatomic, copy) NSString* baseUrl;
@property (nonatomic, copy) NSString* apiKey;
@property (nonatomic, copy) NSNumber* serviceTag;
@property (nonatomic, strong) id payload;

@property (nonatomic, weak) id<STAServiceLibraryDelegate> delegate;

+(BOOL)isInternetReachable;
+(BOOL)isInternetConnectWIFI;


- (void)getHotelDetails:(STAHotelDetails *)hotelDetails  delegate:(id)delegate;
@end
