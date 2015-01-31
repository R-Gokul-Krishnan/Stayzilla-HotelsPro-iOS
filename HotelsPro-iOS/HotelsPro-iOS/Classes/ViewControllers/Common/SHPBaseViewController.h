//
//  ViewController.h
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

@import UIKit;

@interface SHPBaseViewController : UIViewController

- (void)showActivityIndicator;
- (void)showActivityIndicatorWithStatus:(NSString *)status;
- (void)dismissActivityIndicator;

@end

