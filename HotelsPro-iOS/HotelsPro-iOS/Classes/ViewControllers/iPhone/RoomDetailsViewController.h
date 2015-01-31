//
//  RoomDetailsViewController.h
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *roomTypeValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *actualTarrifLabel;

@property (weak, nonatomic) IBOutlet UILabel *discountedTarrifLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberOfOccupantsLabel;

@property (weak, nonatomic) IBOutlet UILabel *extraBedValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *ichRoomValueLabel;

@end
