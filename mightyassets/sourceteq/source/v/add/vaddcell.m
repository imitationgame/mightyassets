#import "vaddcell.h"
#import "uicolor+uicolormain.h"

@implementation vaddcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
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
        [self setAlpha:0.35];
    }
    else
    {
        [self setAlpha:1];
    }
}

#pragma mark public

-(void)config:(madditem*)model
{
    self.model = model;
    [self hover];
}

@end