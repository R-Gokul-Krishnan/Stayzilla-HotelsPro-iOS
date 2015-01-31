//
//  UIImage+FromView.h
//  HUtils
//
//  Created by Photon on 22/04/13.
//  Copyright (c) 2013 photon. All rights reserved.
//

#import <UIKit/UIKit.h>

/*------------------------------------------------------------------------------------*/

@interface UIImage (FromView)

/*------------------------------------------------------------------------------------*/

/*!
 * @function +imageFromView:opaque:
 * @deprecated Use UIView+Image's -asImage or -asOpaqueImage.
 */
+ (UIImage *)imageFromView:(UIView *)a_view opaque:(BOOL)opaque DEPRECATED_ATTRIBUTE;

/*------------------------------------------------------------------------------------*/

@end
