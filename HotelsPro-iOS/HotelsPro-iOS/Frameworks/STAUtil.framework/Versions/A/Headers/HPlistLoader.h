//
//  HPlistLoader.h
//  HeliosNavigation
//

#import <Foundation/Foundation.h>

@interface HPlistLoader : NSObject
+ (NSDictionary *)fetchDictionaryFromPlist:(NSString *) plistFile inBundle:(NSString *) bundleOrNil;
@end
