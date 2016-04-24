#import "vaddcolorcell.h"

static NSInteger const circlesize = 50;

@implementation vaddcolorcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *circle = [[UIView alloc] init];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor colorWithWhite:0.9 alpha:1].CGColor];
    [circle.layer setCornerRadius:circlesize / 2.0];
    self.circle = circle;
    
    [self addSubview:circle];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat remainhr = width - circlesize;
    CGFloat marginleft = remainhr / 2.0;
    CGFloat remainvr = height - circlesize;
    CGFloat margintop = remainvr / 2.0;
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{@"size":@(circlesize), @"left":@(marginleft), @"top":@(margintop)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[circle(size)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[circle(size)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:0.2];
    }
    else
    {
        [self setAlpha:1];
    }
}

#pragma mark public

-(void)config:(maddcoloritem*)model
{
    [self.circle setBackgroundColor:model.color];
    [self hover];
}

@end