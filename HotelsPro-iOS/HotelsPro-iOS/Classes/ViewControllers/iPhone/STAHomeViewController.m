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
#import <CoreLocation/CoreLocation.h>
#import <STAUtil/NSString+Utils.h>
#import <STAUtil/STAUtility.h>
#import "STAConstants.h"


#define kDateFormat                  @"dd/MM/yyyy"


@interface STAHomeViewController ()<UITextFieldDelegate, STAServiceLibraryDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkinTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkOutTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (nonatomic, strong) CLLocationManager         *locationManager;



- (IBAction)searchButtonAction:(id)sender;

@end

@implementation STAHomeViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
     _locationManager = [[CLLocationManager alloc] init];
    STAHotelDetailsViewController *hotelDetailsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HotelDetailsViewController"];
     //[[self navigationController] pushViewController:hotelDetailsViewController animated:YES];
}

#pragma mark - IBAction Methods

- (IBAction)searchButtonAction:(id)sender {
    
    if (![STAUtility validateString:[[self locationTextField] text]] && (![STAUtility validateString:[[self latitudeTextField] text]] || ![STAUtility validateString:[[self longitude] text]])) {
        [self showAlertMessage:@"Please enter Location or latitue and longitude" andMessage:nil andDelegate:nil];
        return;
    }
    if (![STAUtility validateString:[[self checkinTextField] text]]) {
        [self showAlertMessage:@"Please enter CheckIn Time" andMessage:nil andDelegate:nil];
        return;
    }
    if (![STAUtility validateString:[[self checkOutTextField] text]]) {
        [self showAlertMessage:@"Please enter CheckOut Time" andMessage:nil andDelegate:nil];
        return;
    }
 

    STAHotelDetails *hotelDetails = [[STAHotelDetails alloc] init];
    [hotelDetails setLocation:[[self locationTextField] text]];
    [hotelDetails setCheckIn:[[[self checkinTextField] text] stringDateFormatChange:kDateFormat]];
    [hotelDetails setCheckOut:[[[self checkOutTextField] text] stringDateFormatChange:kDateFormat]];
    [hotelDetails setPropertyType:@"Hotels"];
    
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = kCFNumberFormatterNoStyle;
    [hotelDetails setLat:[format numberFromString:[[self latitudeTextField] text]]];
    [hotelDetails setLng:[format numberFromString:[[self longitude] text]]];
    
    
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

    
}

- (IBAction)getCurrentLocation:(id)sender
{
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];

    
    if([CLLocationManager locationServicesEnabled] &&
       [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusNotDetermined && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted) {
        [self showActivityIndicator];
    }
    else
    {
        [self showAlertMessage:kFailedLocationServiceEnable andMessage:nil andDelegate:nil];
       
    }
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self dismissActivityIndicator];
    [_locationManager stopUpdatingLocation];
    if (![STAServiceLibrary isInternetReachable]) {
        
        [self showAlertMessage:ERROR_NO_INTERNET_CONNECTION andMessage:nil andDelegate:nil];
        
    }
    else
    {
        [self showAlertMessage:ERROR_GLOBAL_EXCEPTION andMessage:nil andDelegate:nil];

    }
   
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateToLocation: %@",  [locations lastObject]);
    CLLocation *currentLocation = [locations lastObject];
    // Stop Location Manager
    [_locationManager stopUpdatingLocation];
    if (currentLocation != nil) {
        
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                CLPlacemark *placemark = [placemarks lastObject];
                
                

                 NSString *latitude = [[NSString alloc] initWithFormat:@"%g", placemark.location.coordinate.latitude];
                 NSString *longitude = [[NSString alloc] initWithFormat:@"%g", placemark.location.coordinate.longitude];
                [[self locationTextField] setText:[placemark locality]];
                [[self latitudeTextField] setText:latitude];
                [[self longitude] setText:longitude];
                [self dismissActivityIndicator];
                
            } else {
                [self dismissActivityIndicator];
                if (![STAServiceLibrary isInternetReachable]) {
                    [self showAlertMessage:ERROR_NO_INTERNET_CONNECTION andMessage:nil andDelegate:nil];
                 
                }
                else
                {
                    [self showAlertMessage:ERROR_GLOBAL_EXCEPTION andMessage:nil andDelegate:nil];
                
                }
                NSLog(@"%@", error.debugDescription);
            }
        } ];
    }
}

-(void)showAlertMessage:(NSString *)title andMessage:(NSString *)message andDelegate:(id)delegate
{
    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:title
                                                             message:message
                                                            delegate:delegate
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
    [errorAlertView show];
}
@end
