//
//  HACollectionViewSmallLayout.m

#import "HACollectionViewSmallLayout.h"
#import "STAConstants.h"
@implementation HACollectionViewSmallLayout

- (id)init
{
    if (!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake(142, 254);
    self.sectionInset = UIEdgeInsetsMake((iPhone5 ? 314 : 224), 2, 0, 2);
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 2.0f;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return NO;
}

@end
