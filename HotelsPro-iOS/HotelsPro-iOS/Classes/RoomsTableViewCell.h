//
//  RoomsTableViewCell.h
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomsTableViewCell : UITableViewCell

- (void)createNumberOfRooms:(int)numberOfRooms fromData:(NSArray *)roomsData;

@end
