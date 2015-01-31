//
//  SHPHomeViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "SHPHomeViewController.h"
#import "HotelDetailsViewController.h"

@interface SHPHomeViewController ()

@end

@implementation SHPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HotelDetailsViewController *hotelDetailsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HotelDetailsViewController"];
     [[self navigationController] pushViewController:hotelDetailsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
