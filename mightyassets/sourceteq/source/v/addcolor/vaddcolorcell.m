#import "vaddcolorcell.h"

static NSInteger const circlesize = 50;

@implementation vaddcolorcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
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
    [self addSubview:circlebase];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat remainhr = width - circlesize;
    CGFloat marginleft = remainhr / 2.0;
    CGFloat remainvr = height - circlesize;
    CGFloat margintop = remainvr / 2.0;
    
    NSDictionary *views = @{@"circle":circle, @"base":circlebase};
    NSDictionary *metrics = @{@"size":@(circlesize), @"left":@(marginleft), @"top":@(margintop)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[base(size)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[base(size)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-1-[circle]-1-|" options:0 metrics:metrics views:views]];
    
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
    [self.circle setTintColor:model.color];
    [self hover];
}

@end