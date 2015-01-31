//
//  SHPHomeViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "STAHomeViewController.h"
#import "STAHotelDetailsViewController.h"
#import <STAServices/STAServiceLibrary.h>
#import <STAServices/STAHotelDetails.h>

@interface STAHomeViewController ()<UITextFieldDelegate, STAServiceLibraryDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkinTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkOutTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;


- (IBAction)searchButtonAction:(id)sender;

@end

@implementation STAHomeViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STAHotelDetailsViewController *hotelDetailsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HotelDetailsViewController"];
     //[[self navigationController] pushViewController:hotelDetailsViewController animated:YES];
}

#pragma mark - IBAction Methods

- (IBAction)searchButtonAction:(id)sender {
    
    [self showActivityIndicator];
    
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
    [self dismissActivityIndicator];
}

- (void)didReceiveError:(STAObject *)errorresponse
{
    [self dismissActivityIndicator];
    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                             message:errorresponse.description
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
    [errorAlertView show];
    
}

@end
