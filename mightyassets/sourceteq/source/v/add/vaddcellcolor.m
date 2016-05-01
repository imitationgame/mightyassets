#import "vaddcellcolor.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "madditemcolors.h"

static NSInteger const circlesize = 40;

@implementation vaddcellcolor

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont boldsize:15]];
    [title setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    self.title = title;
    
    UIImageView *circlebase = [[UIImageView alloc] init];
    [circlebase setUserInteractionEnabled:NO];
    [circlebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circlebase setContentMode:UIViewContentModeScaleAspectFit];
    [circlebase setImage:[UIImage imageNamed:@"add_circlesmall"]];
    [circlebase setClipsToBounds:YES];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setContentMode:UIViewContentModeScaleAspectFit];
    [circle setImage:[[UIImage imageNamed:@"add_circlesmall"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setClipsToBounds:YES];
    self.circle = circle;
    
    [circlebase addSubview:circle];
    [self addSubview:title];
    [self addSubview:circlebase];
    
    NSDictionary *views = @{@"title":title, @"circle":circle, @"base":circlebase};
    NSDictionary *metrics = @{@"circlesize":@(circlesize)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[base(circlesize)]-10-[title(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[base]-12-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemcolors*)model topcollection:(UICollectionView*)topcollection
{
    [self.title setText:model.title];
    [self.circle setTintColor:model.color];
    [super config:model topcollection:topcollection];
}

@end