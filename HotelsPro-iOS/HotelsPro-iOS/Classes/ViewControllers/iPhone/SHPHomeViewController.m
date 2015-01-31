//
//  SHPHomeViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "SHPHomeViewController.h"
#import "HotelDetailsViewController.h"
#import <STAServices/STAServiceLibrary.h>
#import <STAServices/STAHotelDetails.h>

@interface SHPHomeViewController ()<UITextFieldDelegate, STAServiceLibraryDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkinTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkOutTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;


- (IBAction)searchButtonAction:(id)sender;

@end

@implementation SHPHomeViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HotelDetailsViewController *hotelDetailsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HotelDetailsViewController"];
     //[[self navigationController] pushViewController:hotelDetailsViewController animated:YES];
}

#pragma mark - IBAction Methods

- (IBAction)searchButtonAction:(id)sender {
    
    STAHotelDetails *hotelDetails = [[STAHotelDetails alloc] init];
    [hotelDetails setLocation:@"Ooty"];
    [hotelDetails setCheckIn:@"06/02/2015"];
    [hotelDetails setCheckOut:@"09/02/2015"];
    [hotelDetails setPropertyType:@"Hotels"];
    STAServiceLibrary* nmService = [[STAServiceLibrary alloc] init];
    
    [nmService getHotelDetails:hotelDetails delegate:self];
}

#pragma mark - STAServiceLibraryDelegates

- (void)didReceiveResponse:(STAObject *)response
{
    
}

- (void)didReceiveError:(STAObject *)errorresponse
{
    
}

@end
