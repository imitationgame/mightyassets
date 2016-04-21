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
    [buttoninteractive setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.4]];
    
    [self addSubview:buttoninteractive];
    
    self.layouttopinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    self.layoutrightinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    self.layoutbottominteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    self.layoutleftinteractive = [NSLayoutConstraint constraintWithItem:buttoninteractive attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraint:self.layouttopinteractive];
    [self addConstraint:self.layoutrightinteractive];
    [self addConstraint:self.layoutbottominteractive];
    [self addConstraint:self.layoutleftinteractive];
    
    return self;
}

#pragma mark public

-(void)config:(mfixedconstraints*)interactive
{
    self.layouttopinteractive.constant = interactive.top.integerValue;
    self.layoutrightinteractive.constant = -interactive.right.integerValue;
    self.layoutbottominteractive.constant = -interactive.bottom.integerValue;
    self.layoutleftinteractive.constant = interactive.left.integerValue;
}

@end