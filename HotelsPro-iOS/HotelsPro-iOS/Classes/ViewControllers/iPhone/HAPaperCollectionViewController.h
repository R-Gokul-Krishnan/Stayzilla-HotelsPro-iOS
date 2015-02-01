//
//  HAPaperCollectionViewController.h


#import <STAServices/STAHotelDetails.h>
#import <STAServices/STAHotel.h>

@import UIKit;

@interface HAPaperCollectionViewController : UICollectionViewController
@property (nonatomic, strong) STAHotelDetails         *hotelDetails;;

- (UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)point;

@end
