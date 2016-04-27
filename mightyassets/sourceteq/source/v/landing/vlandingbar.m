#import "vlandingbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

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
    
    [self addSubview:label];
    [self addSubview:iconadd];
    
    NSDictionary *views = @{@"buttonadd":iconadd, @"label":label};
    NSDictionary *metrics = @{@"buttonbottom":@(buttonbottommargin), @"buttonright":@(buttonrightmargin), @"buttonleft":@(buttonleftmargin), @"buttonheight":@(buttonheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[buttonadd]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[label]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(18)]-0-[buttonadd(buttonheight)]-(buttonbottom)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end