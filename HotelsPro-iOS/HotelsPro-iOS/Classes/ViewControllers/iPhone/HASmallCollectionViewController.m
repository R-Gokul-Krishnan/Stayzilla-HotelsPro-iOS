//
//  HASmallCollectionViewController.m


#import "HASmallCollectionViewController.h"
#import "HACollectionViewLargeLayout.h"

@interface HASmallCollectionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger slide;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIImageView *topImage;
@property (nonatomic, strong) UIImageView *reflected;
@property (nonatomic, strong) NSArray *galleryImages;

@end

@implementation HASmallCollectionViewController

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [self nextViewControllerAtPoint:CGPointZero];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UICollectionViewController *)nextViewControllerAtPoint:(CGPoint)point
{
    // We could have multiple section stacks and find the right one,
    HACollectionViewLargeLayout *largeLayout = [[HACollectionViewLargeLayout alloc] init];
    HAPaperCollectionViewController *nextCollectionViewController = [[HAPaperCollectionViewController alloc] initWithCollectionViewLayout:largeLayout];
    
    nextCollectionViewController.useLayoutToLayoutNavigationTransitions = YES;
    return nextCollectionViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Gallery
    _galleryImages = @[@"image", @"image1", @"image2", @"image3", @"image4", @"image5", @"image6"];
    _slide = 0;
    
    
    // Init mainView
    _mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    _mainView.clipsToBounds = YES;
    _mainView.layer.cornerRadius = 4;
    [self.view insertSubview:_mainView belowSubview:self.collectionView];
    
    // ImageView on top
    _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    _reflected = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_topImage.bounds), 320, 320)];
    [_mainView addSubview:_topImage];
    [_mainView addSubview:_reflected];
    
    
    // Reflect imageView
    _reflected.transform = CGAffineTransformMakeScale(1.0, -1.0);
    
    
    // Gradient to top image
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _topImage.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4] CGColor],
                        (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [_topImage.layer insertSublayer:gradient atIndex:0];
    
    
    // Gradient to reflected image
    CAGradientLayer *gradientReflected = [CAGradientLayer layer];
    gradientReflected.frame = _reflected.bounds;
    gradientReflected.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor],
                                 (id)[[UIColor colorWithWhite:0 alpha:0] CGColor]];
    [_reflected.layer insertSublayer:gradientReflected atIndex:0];
    
    
    // Content perfect pixel
    UIView *perfectPixelContent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_topImage.bounds), 1)];
    perfectPixelContent.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    [_topImage addSubview:perfectPixelContent];
    
    
      // First Load
    [self changeSlide];
    
    // Loop gallery - fix loop: http://bynomial.com/blog/?p=67
    NSTimer *timer = [NSTimer timerWithTimeInterval:5.0f target:self selector:@selector(changeSlide) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - Change slider
- (void)changeSlide
{
    //    if (_fullscreen == NO && _transitioning == NO) {
    if(_slide > _galleryImages.count-1) _slide = 0;
    
    UIImage *toImage = [UIImage imageNamed:_galleryImages[_slide]];
    [UIView transitionWithView:_mainView
                      duration:0.6f
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationCurveEaseInOut
                    animations:^{
                        _topImage.image = toImage;
                        _reflected.image = toImage;
                    } completion:nil];
    _slide++;
    //    }
}

@end
