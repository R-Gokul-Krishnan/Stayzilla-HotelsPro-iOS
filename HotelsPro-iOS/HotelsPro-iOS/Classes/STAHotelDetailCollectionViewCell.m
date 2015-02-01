//
//  STAHotelDetailCollectionViewCell.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 2/1/15.
//
//

#import "STAHotelDetailCollectionViewCell.h"
#import "SimpleView.h"

@implementation STAHotelDetailCollectionViewCell

- (void)setupUI {
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    STAHotelDetailsViewController *hotelDetailVC = [storyboard instantiateViewControllerWithIdentifier:@"HotelDetailsViewController"];
//    [self.contentView addSubview:hotelDetailVC.view];
    SimpleView *simple = [[SimpleView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:simple];
}

@end
