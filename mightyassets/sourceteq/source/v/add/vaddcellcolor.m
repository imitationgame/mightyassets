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
    [title setFont:[UIFont boldsize:16]];
    [title setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
    self.title = title;
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle.layer setCornerRadius:circlesize / 2.0];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor background].CGColor];
    self.circle = circle;
    
    [self addSubview:title];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"title":title, @"circle":circle};
    NSDictionary *metrics = @{@"circlesize":@(circlesize)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[circle(circlesize)]-10-[title(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[circle(circlesize)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemcolors*)model
{
    [self.title setText:model.title];
    [self.circle setBackgroundColor:model.color];
    [super config:model];
}

@end