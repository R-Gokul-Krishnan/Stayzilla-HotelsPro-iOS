//
//  STADatePickerViewController.m
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 2/1/15.
//
//

#import "STADatePickerViewController.h"

#define kSTADateFormat @"dd/MM/yy"

@interface STADatePickerViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker* datePicker;

@end

@implementation STADatePickerViewController

- (IBAction)datePickerDoneButtonAction:(id)sender {
    
    
    NSString *convertedDate = [[self.datePicker date] toStingWithFormat:kSTADateFormat];
    
    if (_doneButtonCompletionBlock) {
        
        _doneButtonCompletionBlock(convertedDate, _dateSelectionType);
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)datePickerCancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
