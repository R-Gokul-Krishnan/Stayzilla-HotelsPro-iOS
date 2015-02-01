//
//  STADatePickerViewController.h
//  HotelsPro-iOS
//
//  Created by Gokul Krishnan on 2/1/15.
//
//

#import "SHPBaseViewController.h"
#import <STAUtil/NSDate+Utils.h>

NS_ENUM(NSInteger, STADatePickerSelectionType) {
    
    STADatePickerSelectionTypeCheckin = 1,
    STADatePickerSelectionTypeCheckout = 2
};

typedef void(^DoneButtonCompletionBlock)(NSString *selectedDateString, enum STADatePickerSelectionType dateSelectionType);

@interface STADatePickerViewController : SHPBaseViewController

@property (nonatomic, copy) DoneButtonCompletionBlock doneButtonCompletionBlock;
@property (nonatomic, assign) enum STADatePickerSelectionType dateSelectionType;

@end
