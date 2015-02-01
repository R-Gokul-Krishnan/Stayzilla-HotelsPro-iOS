//
//  HATransitionController.h


@import UIKit;

@protocol HATransitionControllerDelegate <NSObject>
- (void)interactionBeganAtPoint:(CGPoint)point;
@end


@interface HATransitionController : NSObject  <UIViewControllerAnimatedTransitioning, UIViewControllerInteractiveTransitioning, UIGestureRecognizerDelegate>

@property (nonatomic) id <HATransitionControllerDelegate> delegate;
@property (nonatomic) BOOL hasActiveInteraction;
@property (nonatomic) UINavigationControllerOperation navigationOperation;
@property (nonatomic) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView*)collectionView;

@end
