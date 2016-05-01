#import "vaddcoloraddheader.h"

static CGFloat const colordivider = 255;
static CGFloat const animationduration = 0.3;
static NSInteger const circlesize = 85;

@implementation vaddcoloraddheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *circlebase = [[UIImageView alloc] init];
    [circlebase setUserInteractionEnabled:NO];
    [circlebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circlebase setContentMode:UIViewContentModeScaleAspectFit];
    [circlebase setImage:[UIImage imageNamed:@"add_circlebig"]];
    [circlebase setClipsToBounds:YES];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setContentMode:UIViewContentModeScaleAspectFit];
    [circle setImage:[[UIImage imageNamed:@"add_circlebig"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setClipsToBounds:YES];
    [circle setTintColor:[UIColor whiteColor]];
    self.circle = circle;
    
    [circlebase addSubview:circle];
    [self addSubview:circlebase];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat remainwidth = width - circlesize;
    CGFloat remainheight = height - circlesize;
    CGFloat left = remainwidth / 2.0;
    CGFloat top = remainheight / 2.0;
    
    NSDictionary *views = @{@"circle":circle, @"base":circlebase};
    NSDictionary *metrics = @{@"size":@(circlesize), @"left":@(left), @"top":@(top)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[base(size)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[base(size)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(maddcoloradd*)model
{
    self.model = model;
    [self refresh];
}

-(void)refresh
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSInteger red = welf.model.red.value;
                       NSInteger green = welf.model.green.value;
                       NSInteger blue = welf.model.blue.value;
                       CGFloat floatred = red / colordivider;
                       CGFloat floatgreen = green / colordivider;
                       CGFloat floatblue = blue / colordivider;
                       UIColor *color = [UIColor colorWithRed:floatred green:floatgreen blue:floatblue alpha:1];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [UIView animateWithDuration:animationduration animations:
                                           ^
                                           {
                                               [welf.circle setTintColor:color];
                                           }];
                                      });
                   });
}

@end