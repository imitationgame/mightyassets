#import "vspinner.h"

static CGFloat const animationduration = 0.5;
static NSUInteger const spinnerintrinsicsize = 40;

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setAnimationDuration:animationduration];
    self.animationImages = @[
                             [UIImage imageNamed:@"loader_0"],
                             [UIImage imageNamed:@"loader_1"],
                             [UIImage imageNamed:@"loader_2"],
                             [UIImage imageNamed:@"loader_3"],
                             [UIImage imageNamed:@"loader_4"],
                             ];
    [self startAnimating];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, spinnerintrinsicsize);
    
    return size;
}

@end