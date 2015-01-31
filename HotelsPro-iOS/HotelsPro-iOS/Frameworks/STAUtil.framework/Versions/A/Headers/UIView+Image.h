//
//  UIView+Image.h
//  HUtils
//
//  Created by Photon on 22/04/13.
//  Copyright (c) 2013 photon. All rights reserved.
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
