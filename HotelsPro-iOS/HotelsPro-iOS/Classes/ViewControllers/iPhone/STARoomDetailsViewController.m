//
//  RoomDetailsViewController.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "STARoomDetailsViewController.h"
#import "STARoomsDetailsTableViewCell.h"

@interface STARoomDetailsViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation STARoomDetailsViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self roomDetailsArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    STARoomsDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roomCellID"];
    [cell setRoomDetails:self.roomDetailsArray[indexPath.row]];
    
    return cell;
}

#pragma mark UITableView Delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Dealloc

- (void)dealloc {
    
    [self setRoomDetailsArray:nil];
}


@end
