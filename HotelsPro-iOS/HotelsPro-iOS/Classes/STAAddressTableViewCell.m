//
//  AddressTableViewCell.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "STAAddressTableViewCell.h"

@interface STAAddressTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *addressTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressValueLabel;

@end

@implementation STAAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setAddressValue:(NSString *)addressValue
{
    [[self addressValueLabel] setText:addressValue];
}

@end
