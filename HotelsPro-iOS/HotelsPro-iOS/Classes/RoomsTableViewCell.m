//
//  RoomsTableViewCell.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "RoomsTableViewCell.h"
#import "STARoomDetailsViewController.h"

@interface RoomsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *roomsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomTypeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomTypeValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *mrpAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountedAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfOccupantsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfOccupantsValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraBedTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraBedValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *ichTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ichValueLabel;

@property (weak, nonatomic) IBOutlet UIPageControl *roomsPageControl;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *roomsContainerViewWidthConstrainr;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *roomDetailsViewWidthConstraint;

@property (weak, nonatomic) IBOutlet UIView *roomContainerView;


@end

@implementation RoomsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [[self roomsContainerViewWidthConstrainr] setConstant:[[self contentView] frame].size.width*3];
    
    [[self roomDetailsViewWidthConstraint] setConstant:[[self contentView] frame].size.width];
    
}

- (void)createNumberOfRooms:(int)numberOfRooms fromData:(NSArray *)roomsData
{
    for (int i = 0; i < numberOfRooms; i++) {
        
        STARoomDetailsViewController *roomDetailsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RoomDetailsViewController"];
        
        // roomsDataObjectAtIndex:i
        
        roomDetailsViewController.roomTypeValueLabel.text = @"Luxurious Room";
        roomDetailsViewController.actualTarrifLabel.text = @"2099";
        roomDetailsViewController.discountedTarrifLabel.text = @"1995";
        roomDetailsViewController.numberOfOccupantsLabel.text = @"2";
        roomDetailsViewController.extraBedValueLabel.text = @"Yes";
        roomDetailsViewController.ichRoomValueLabel.text = @"Yes";
        
        [roomDetailsViewController.view setFrame:CGRectMake(self.contentView.frame.size.width*i, 0, self.contentView.frame.size.width, roomDetailsViewController.view.frame.size.height)];
        
        [[self roomContainerView] addSubview:roomDetailsViewController.view];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
