//
//  HPlistLoader.h
//  HeliosNavigation
//
//  Created by Amar Ellareddy on 25/04/13.
//  Copyright (c) 2013 photon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPlistLoader : NSObject
+ (NSDictionary *)fetchDictionaryFromPlist:(NSString *) plistFile inBundle:(NSString *) bundleOrNil;
@end
