//
//  NMCFAUtility.h
//  NMCFAUtil
//
//  Created by Palani_AC on 16/05/13.
//  Copyright (c) 2013 photon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STAUtility : NSObject






+(NSString *) errorMessageTobeDisplayed:(int) textFieldType;
+(BOOL)validateProdId:(NSString *)prodId;
+(NSString *) currentDeviceIdentifier;
+(NSArray *)getcookieList:(NSArray *)cookieArray;
+ (NSString *)getHoursAndFormatted:(NSString *)storeHours;
+(void)setCharacterSpacing:(CGFloat)characterSpacing andLineSpacing:(CGFloat)lineSpacing forLabel:(UILabel *)lable;
+(CGRect)getScreenFrameForOrientation;
+(CGRect)getScreenFrameForOrientation:(UIInterfaceOrientation)interfaceOrientation;

+(id)fnCheckForObjectValidity:(id)sInput;

+(BOOL)validateString:(NSString *)string;
+(BOOL)validatePhoneNumber:(NSString *)phoneNumber;
+(BOOL)validateZipcode:(NSString *)zipCode;
+(BOOL)validateCity:(NSString *)cityName;
+(BOOL)validateSpce:(NSString *)string;
+(BOOL)validatePassword:(NSString *)password;
+(BOOL)validateEmail:(NSString *)emailId;
+(BOOL)validateMobileWalletPIN:(NSString *)pin;

@end
