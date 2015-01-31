//
//  DistanceTableViewCell.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "DistanceTableViewCell.h"

@interface DistanceTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *distanceTitleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *airportImageView;
@property (weak, nonatomic) IBOutlet UIImageView *railwayStationImageView;
@property (weak, nonatomic) IBOutlet UIImageView *busStandImageView;

@property (weak, nonatomic) IBOutlet UILabel *airportValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *railwayStationValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *budStandValueLabel;

@end

@implementation DistanceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setAirPortText:(NSString *)airportText andRailwayText:(NSString *)railwayText andBusStandText:(NSString *)busStandText
{
    [[self airportValueLabel] setText:airportText];
    [[self railwayStationValueLabel] setText:railwayText];
    [[self budStandValueLabel] setText:busStandText];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
