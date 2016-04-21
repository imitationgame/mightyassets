#import "vlandingbar.h"
#import "uicolor+uicolormain.h"

static NSInteger const buttontopmargin = 100;
static NSInteger const buttonrightmargin = -100;
static NSInteger const buttonbottommargin = -100;
static NSInteger const buttonleftmargin = 100;

@implementation vlandingbar

-(instancetype)init:(clanding*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    self.interactiveconstraints = [[mfixedconstraints alloc] init:buttontopmargin right:buttonrightmargin bottom:buttonbottommargin left:buttonleftmargin];
    
    UIButton *buttonadd = [[UIButton alloc] init];
    [buttonadd setClipsToBounds:YES];
    [buttonadd setBackgroundColor:[UIColor whiteColor]];
    [buttonadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonadd setTitle:@"+" forState:UIControlStateNormal];
    [buttonadd setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonadd.layer setCornerRadius:20];
    
    [self addSubview:buttonadd];
    
    NSDictionary *views = @{@"buttonadd":buttonadd};
    NSDictionary *metrics = @{@"buttontop":self.interactiveconstraints.top, @"buttonright":self.interactiveconstraints.right, @"buttonbottom":self.interactiveconstraints.bottom, @"buttonleft":self.interactiveconstraints.left};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(buttonleft)-[buttonadd]-(buttonright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(buttontop)-[buttonadd]-(buttonbottom)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end