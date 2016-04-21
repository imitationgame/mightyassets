#import "vlandingbar.h"
#import "uicolor+uicolormain.h"

static NSInteger const buttonbottommargin = 100;
static NSInteger const buttonrightmargin = 100;
static NSInteger const buttonleftmargin = 100;
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
    
    UIButton *buttonadd = [[UIButton alloc] init];
    [buttonadd setClipsToBounds:YES];
    [buttonadd setBackgroundColor:[UIColor whiteColor]];
    [buttonadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonadd setTitle:@"+" forState:UIControlStateNormal];
    [buttonadd setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonadd.layer setCornerRadius:20];
    
    [self addSubview:buttonadd];
    
    NSDictionary *views = @{@"buttonadd":buttonadd};
    NSDictionary *metrics = @{@"buttonbottom":@(buttonbottommargin), @"buttonright":@(buttonrightmargin), @"buttonleft":@(buttonleftmargin), @"buttonheight":@(buttonheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[buttonadd]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonadd(buttonheight)]-(buttonbottom)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end