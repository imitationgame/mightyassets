#import "vlandingclearheader.h"

@implementation vlandingclearheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UIButton *buttoninteractive = [[UIButton alloc] init];
    [buttoninteractive setClipsToBounds:YES];
    [buttoninteractive setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoninteractive setBackgroundColor:[UIColor clearColor]];
    [buttoninteractive addTarget:self action:@selector(actioninteractive:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttoninteractive];
    
    self.layoutbottominteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    self.layoutrightinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    self.layoutleftinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.layoutheightinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraint:self.layoutbottominteractive];
    [self addConstraint:self.layoutrightinteractive];
    [self addConstraint:self.layoutleftinteractive];
    [self addConstraint:self.layoutheightinteractive];
    
    return self;
}

#pragma mark actions

-(void)actioninteractive:(UIButton*)button
{
    [self.controller addproject];
}

#pragma mark public

-(void)config:(clanding*)controller constraints:(mfixedconstraints*)interactive
{
    self.controller = controller;
    self.layoutbottominteractive.constant = -interactive.bottom;
    self.layoutrightinteractive.constant = -interactive.right;
    self.layoutleftinteractive.constant = interactive.left;
    self.layoutheightinteractive.constant = interactive.height;
}

@end