//
//  SHPHomeViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 1/31/15.
//
//

#import "STAHomeViewController.h"
#import "STAHotelDetailsViewController.h"
#import "STARoomDetailsViewController.h"
#import <STAServices/STAServiceLibrary.h>
#import <STAServices/STAHotelDetails.h>
#import <CoreLocation/CoreLocation.h>
#import <STAUtil/NSString+Utils.h>
#import <STAUtil/STAUtility.h>
#import "STAConstants.h"
#import <STAServices/STAHotel.h>
#import "HACollectionViewSmallLayout.h"
#import "HASmallCollectionViewController.h"
#import "HATransitionController.h"
#import "STADatePickerViewController.h"


#define kDateFormat                  @"dd/MM/yyyy"


@interface STAHomeViewController ()<UITextFieldDelegate, STAServiceLibraryDelegate,CLLocationManagerDelegate,HATransitionControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkinTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkOutTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *checkInButton;
@property (weak, nonatomic) IBOutlet UIButton *checkOutButton;

@property (nonatomic, strong) CLLocationManager         *locationManager;
@property (nonatomic) HATransitionController *transitionController;


- (IBAction)searchButtonAction:(id)sender;
- (IBAction)presentDatePicker:(id)sender;

@end

@implementation STAHomeViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
     _locationManager = [[CLLocationManager alloc] init];
   
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
    [self showActivityIndicator];
    [[self locationTextField] setText:@"Ooty"];
    [[self checkinTextField] setText:@"06/02/2015"];
    [[self checkOutTextField] setText:@"09/02/2015"];

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
    STAHotelDetails *hotelDetails = objc_dynamic_cast(STAHotelDetails, response);
    if (hotelDetails == nil || [[hotelDetails hotels] count] == 0) {
        [self showAlertMessage:@"sorry! Please try someother location" andMessage:nil andDelegate:nil];
        return;
    }
//    STARoomDetailsViewController *roomDetailsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RoomDetailsViewController"];
//    [roomDetailsVC setRoomDetailsArray:[(STAHotel *)[(STAHotelDetails *)response hotels][0] rooms]];
    HAPaperCollectionViewController *vc = [self showHotelDetailView];
    [vc setHotelDetails:hotelDetails];
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)didReceiveError:(STAObject *)errorresponse
{
    [self dismissActivityIndicator];

    if (![STAServiceLibrary isInternetReachable]) {
        
        [self showAlertMessage:ERROR_NO_INTERNET_CONNECTION andMessage:nil andDelegate:nil];
        
    }
    else
    {
        [self showAlertMessage:ERROR_GLOBAL_EXCEPTION andMessage:nil andDelegate:nil];
        
    }
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

- (void)presentDatePicker:(id)sender {
    
    UIButton *datePickerButton = (UIButton *)sender;
    
    UIStoryboard *storboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    STADatePickerViewController *_datePickerVC = [storboard instantiateViewControllerWithIdentifier:@"datePickerVC"];
    _datePickerVC.dateSelectionType = datePickerButton.tag;
    
    [_datePickerVC setDoneButtonCompletionBlock:^(NSString *selectedDateString, enum STADatePickerSelectionType dateSelectionType){
       
        if (dateSelectionType == STADatePickerSelectionTypeCheckin) {
            
            [self.checkinTextField setText:selectedDateString];
            [self.checkInButton setTitle:@"" forState:UIControlStateNormal];
        }
        else {
            
            [self.checkOutTextField setText:selectedDateString];
            [self.checkOutButton setTitle:@"" forState:UIControlStateNormal];
        }
    }];
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 8.0) {
        _datePickerVC.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    else {
        _datePickerVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    [self presentViewController:_datePickerVC animated:YES completion:nil];
}

#pragma mark - LocationManager

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

-(HASmallCollectionViewController *)showHotelDetailView
{
    HACollectionViewSmallLayout *smallLayout = [[HACollectionViewSmallLayout alloc] init];
    HASmallCollectionViewController *collectionViewController = [[HASmallCollectionViewController alloc] initWithCollectionViewLayout:smallLayout];
    
    self.transitionController = [[HATransitionController alloc] initWithCollectionView:collectionViewController.collectionView];
    self.transitionController.delegate = self;
    
    return collectionViewController;
}



- (void)interactionBeganAtPoint:(CGPoint)point
{
    // Very basic communication between the transition controller and the top view controller
    // It would be easy to add more control, support pop, push or no-op
    HASmallCollectionViewController *presentingVC = (HASmallCollectionViewController *)[self.navigationController topViewController];
    HASmallCollectionViewController *presentedVC = (HASmallCollectionViewController *)[presentingVC nextViewControllerAtPoint:point];
    if (presentedVC!=nil)
    {
        [self.navigationController pushViewController:presentedVC animated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    if (animationController==self.transitionController) {
        return self.transitionController;
    }
    return nil;
}


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (![fromVC isKindOfClass:[UICollectionViewController class]] || ![toVC isKindOfClass:[UICollectionViewController class]])
    {
        return nil;
    }
    if (!self.transitionController.hasActiveInteraction)
    {
        return nil;
    }
    
    self.transitionController.navigationOperation = operation;
    return self.transitionController;
}

@end
