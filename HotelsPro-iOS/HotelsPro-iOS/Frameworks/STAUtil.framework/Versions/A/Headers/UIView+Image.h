//
//  UIView+Image.h
//  HUtils
//
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Image)

/*!
 * @function -asImage
 * @return The contents of the receiver's layer property, rendered as a UIImage.
 * @brief Converts the receiver into a UIImage.
 */
- (UIImage *)asImage;

/*!
 * @function -asOpaqueImage
 * @return The contents of the receiver's layer property, rendered as a UIImage with no alpha channel.
 * @brief Converts the receiver into a UIImage.
 */
- (UIImage *)asOpaqueImage;

@end
