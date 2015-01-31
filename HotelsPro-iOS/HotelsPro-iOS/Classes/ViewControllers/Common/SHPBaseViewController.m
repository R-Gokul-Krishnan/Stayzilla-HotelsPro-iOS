//
//  ViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "SHPBaseViewController.h"
#import "MBProgressHUD.h"

@interface SHPBaseViewController ()<MBProgressHUDDelegate>
@property (nonatomic, strong) MBProgressHUD *activityIndicatorHUD;
@end

@implementation SHPBaseViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark SVP Progress Indicator related

- (void)showActivityIndicator {
    
    self.activityIndicatorHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.activityIndicatorHUD.delegate = self;
}

- (void)showActivityIndicatorWithStatus:(NSString *)status {
    
    self.activityIndicatorHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.activityIndicatorHUD.mode = MBProgressHUDModeIndeterminate;
    self.activityIndicatorHUD.labelText = status;
    self.activityIndicatorHUD.delegate = self;
}

- (void)dismissActivityIndicator {
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorHUD hide:YES afterDelay:0.25f];
        });
    });
}

#pragma mark -
#pragma mark MBProgressHUD Delegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [self.activityIndicatorHUD removeFromSuperview];
    self.activityIndicatorHUD = nil;
}

#pragma mark -
#pragma mark Dealloc & MemoryWarnings

- (void)dealloc {
    
    [self setActivityIndicatorHUD:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
