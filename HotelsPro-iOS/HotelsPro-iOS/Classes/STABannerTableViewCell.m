//
//  BannerTableViewCell.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "STABannerTableViewCell.h"

@interface STABannerTableViewCell ()

@property (weak, nonatomic) IBOutlet UIScrollView *ImageContainerScrollView;
@property (weak, nonatomic) IBOutlet UIView *imageContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *galleryImageView;


@property (weak, nonatomic) IBOutlet UIPageControl *galleryPageControl;


@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;


@property (weak, nonatomic) IBOutlet UIView *hotelPriceBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *hotelPriceLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContainerViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *priceVisualEffectView;

@end

@implementation STABannerTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}


- (void)createImageViewsFromData:(NSArray *)imageData
{
    for (int i=0; i < [imageData count]; i++) {
        
        UIImageView *galleryImageView = [[UIImageView alloc] init];
        [galleryImageView setFrame:CGRectMake(([self contentView].frame.size.width * i), 0, [self contentView].frame.size.width, [[self imageContainerView] frame].size.height)];
        [galleryImageView setBackgroundColor:[UIColor greenColor]];
        
        // set the images here
        [galleryImageView setImage:[imageData objectAtIndex:i]];
        [[self imageContainerView] addSubview:galleryImageView];
    }
}

- (void)setGalleryImages:(NSArray *)galleryImagesArray withHotelName:(NSString *)hotelName andHotelCity:(NSString *)hotelCity andHotelRating:(NSString *)hotelRating andHotelPrice:(NSString *)hotelPrice
{
    [[self imageContainerViewWidthConstraint] setConstant:(self.contentView.frame.size.width*[galleryImagesArray count])];
    
    [self createImageViewsFromData:galleryImagesArray];
    [[self hotelNameLabel] setText:hotelName];
    [[self cityNameLabel] setText:hotelCity];
    [[self hotelPriceLabel] setText:hotelPrice];
    // set the hotel rating
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
