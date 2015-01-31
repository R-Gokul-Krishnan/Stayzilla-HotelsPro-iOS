//
//  BannerTableViewCell.h
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerTableViewCell : UITableViewCell

- (void)setGalleryImages:(NSArray *)galleryImagesArray withHotelName:(NSString *)hotelName andHotelCity:(NSString *)hotelCity andHotelRating:(NSString *)hotelRating andHotelPrice:(NSString *)hotelPrice;

@end
