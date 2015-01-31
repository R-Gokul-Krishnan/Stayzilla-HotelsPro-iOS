//
//  RoomsTableViewCell.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "STARoomsDetailsTableViewCell.h"

@interface STARoomsDetailsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *roomTypeValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *actualTarrifLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountedTarrifLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfOccupantsLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraBedValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *ichRoomValueLabel;

@end

@implementation STARoomsDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setRoomDetails:(STARoom *)roomDetails {
    
    [self.roomTypeValueLabel setText:roomDetails.rtype];
    [self.actualTarrifLabel setText:roomDetails.rtariffDisp];
    [self.discountedTarrifLabel setText:roomDetails.rdiscountDisp];
    [self.numberOfOccupantsLabel setText:roomDetails.roccupants];
    [self.ichRoomValueLabel setText:(roomDetails.isICHRoom) ? @"YES" : @"NO"];
}

@end
