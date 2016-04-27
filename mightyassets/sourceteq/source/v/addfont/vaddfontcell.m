#import "vaddfontcell.h"
#import "uicolor+uicolormain.h"

@implementation vaddfontcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setBackgroundColor:[UIColor background]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    self.label = label;
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:label];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"borderbottom":borderbottom, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[borderbottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)config:(madditemtitlesfontitem*)model
{
    [self.label setText:model.name];
    [self.label setFont:[UIFont fontWithName:model.font size:18]];
    [self hover];
}

@end