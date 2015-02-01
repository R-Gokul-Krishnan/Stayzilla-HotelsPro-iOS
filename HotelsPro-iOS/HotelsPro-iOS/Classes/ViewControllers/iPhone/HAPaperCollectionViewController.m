//
//  HAPaperCollectionViewController.m


#import "HAPaperCollectionViewController.h"
#import "HATransitionLayout.h"
#import "STAHotelDetailsViewController.h"
#import "STAHotelDetailCollectionViewCell.h"


#define MAX_COUNT 20
#define CELL_ID @"CELL_ID"

@interface HAPaperCollectionViewController ()

@end



@implementation HAPaperCollectionViewController

- (id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    if (self = [super initWithCollectionViewLayout:layout])
    {
  
        
        
        [self.collectionView registerClass:[STAHotelDetailCollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        [[self collectionView] reloadData];
    }
    return self;
}

#pragma mark - Hide StatusBar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    STAHotelDetailCollectionViewCell *hotelCell = (STAHotelDetailCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    hotelCell.backgroundColor = [UIColor whiteColor];
    hotelCell.layer.cornerRadius = 4;
    hotelCell.clipsToBounds = YES;
    
    STAHotel *hotel =  objectAtIndex([[self hotelDetails] hotels], indexPath.row);
    [hotelCell setupUI];
 
    
    return hotelCell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self hotelDetails] hotels] count];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewController*)nextViewControllerAtPoint:(CGPoint)point
{
    return nil;
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView
                        transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout
{
    HATransitionLayout *transitionLayout = [[HATransitionLayout alloc] initWithCurrentLayout:fromLayout nextLayout:toLayout];
    return transitionLayout;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Adjust scrollView decelerationRate
    self.collectionView.decelerationRate = self.class != [HAPaperCollectionViewController class] ? UIScrollViewDecelerationRateNormal : UIScrollViewDecelerationRateFast;
}

@end
