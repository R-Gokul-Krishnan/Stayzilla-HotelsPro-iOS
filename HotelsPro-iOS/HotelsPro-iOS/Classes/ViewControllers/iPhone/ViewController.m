//
//  ViewController.m
//  DetailViewController
//
//  Created by Paul Miller on 31/01/15.
//  Copyright (c) 2015 Paul Kalapati. All rights reserved.
//

#import "ViewController.h"

#import "BannerTableViewCell.h"
#import "AddressTableViewCell.h"
#import "DistanceTableViewCell.h"
#import "RoomsTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch ([indexPath section]) {
            
        case 0:
        {
            BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BannerTableViewCellIdentifier"];
            
            // cell setGalleryImages:<#(NSArray *)#> withHotelName:<#(NSString *)#> andHotelCity:<#(NSString *)#> andHotelRating:<#(NSString *)#>
            
            if (cell == nil) {
                
                cell = (BannerTableViewCell *) [[BannerTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BannerTableViewCellIdentifier"];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
        }
            break;
            
        case 1:
        {
            AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressTableViewCellIdentifier"];
            
            // [cell setAddressValue:<#(NSString *)#>]
            
            if (cell == nil) {
                
                cell = (AddressTableViewCell *)[[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AddressTableViewCellIdentifier"];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
        }
            break;
            
        case 2:
        {
            DistanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DistanceTableViewCellIdentifier"];
            
            // [cell setAirPortText:<#(NSString *)#> andRailwayText:<#(NSString *)#> andBusStandText:<#(NSString *)#>]
            
            if (cell == nil) {
                
                cell = (DistanceTableViewCell *) [[DistanceTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DistanceTableViewCellIdentifier"];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
        }
            break;
            
        case 3:
        {
            RoomsTableViewCell *cell = (RoomsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"RoomsTableViewCellIdentifier"];
            
            // [cell createNumberOfRooms:<#(int)#> fromData:<#(NSArray *)#>]
            
            if (cell == nil) {
                
                cell = [[RoomsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"RoomsTableViewCellIdentifier"];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            
            return cell;
        }
            break;
            
            
            
        default:
            break;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch ([indexPath section]) {
            
        case 0:
        {
            // BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BannerTableViewCellIdentifier"];
            return 261.0f;
        }
            break;
            
        case 1:
        {
            // AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressTableViewCellIdentifier"];
            // calculate height from the address label
            return 84.0f;
        }
            break;
            
        case 2:
        {
            // DistanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DistanceTableViewCellIdentifier"];
            return 158.0f;
        }
            break;
            
        case 3:
        {
            // RoomsTableViewCell *cell = (RoomsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"RoomsTableViewCellIdentifier"];
            return 235.0f;
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
