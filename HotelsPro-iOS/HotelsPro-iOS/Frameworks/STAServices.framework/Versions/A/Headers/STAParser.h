//
//  STAParser.h
//  STAServices
//
//  Created by Vijayaragavan_M on 31/1/15.
//  Copyright (c) 2014 Photon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STAParser : NSObject

+ (NSDictionary *)parseJson:(NSString *)jsonString;
+ (NSDictionary *)parseJsonWithHtml:(NSString *)jsonString;
+ (NSString *)stripHTMLTags:(NSString *)s;
+ (NSString *)removeHTMlTag:(NSString *)tag fromString:(NSString *)string;

@end
