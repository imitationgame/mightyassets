#import "vlandingbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static NSInteger const maxlogotop = 40;
static NSInteger const maxbarheight = 200;
static NSInteger const buttonbottommargin = 20;
static NSInteger const buttonrightmargin = 110;
static NSInteger const buttonleftmargin = 110;
static NSInteger const buttonheight = 50;

@implementation vlandingbar

-(instancetype)init:(clanding*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    self.interactiveconstraints = [[mfixedconstraints alloc] init];
    self.interactiveconstraints.bottom = buttonbottommargin;
    self.interactiveconstraints.right = buttonrightmargin;
    self.interactiveconstraints.left = buttonleftmargin;
    self.interactiveconstraints.height = buttonheight;
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setClipsToBounds:YES];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setUserInteractionEnabled:NO];
    [logo setContentMode:UIViewContentModeScaleAspectFit];
    [logo setImage:[[UIImage imageNamed:@"generic_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [logo setTintColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont regularsize:15]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:NSLocalizedString(@"landing_header_title", nil)];
    
    UIImageView *iconadd = [[UIImageView alloc] init];
    [iconadd setUserInteractionEnabled:NO];
    [iconadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconadd setClipsToBounds:YES];
    [iconadd setContentMode:UIViewContentModeCenter];
    [iconadd setImage:[[UIImage imageNamed:@"generic_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [iconadd setTintColor:[UIColor whiteColor]];
    
    [self addSubview:logo];
    [self addSubview:label];
    [self addSubview:iconadd];
    
    NSDictionary *views = @{@"buttonadd":iconadd, @"label":label, @"logo":logo};
    NSDictionary *metrics = @{@"buttonbottom":@(buttonbottommargin), @"buttonright":@(buttonrightmargin), @"buttonleft":@(buttonleftmargin), @"buttonheight":@(buttonheight)};
    
    self.layoutlogotop = [NSLayoutConstraint constraintWithItem:logo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:maxlogotop];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[buttonadd]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[label]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonadd(buttonheight)]-(buttonbottom)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-174-[label(26)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[logo]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[logo(100)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlogotop];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat height = self.bounds.size.height;
    CGFloat delta = maxbarheight - height;
    CGFloat delta_4 = delta / 4.0;
    CGFloat top = maxlogotop - delta_4;
    
    if(top > maxlogotop)
    {
        top = maxlogotop;
    }
    
    self.layoutlogotop.constant = top;
    
    [super layoutSubviews];
}

@end