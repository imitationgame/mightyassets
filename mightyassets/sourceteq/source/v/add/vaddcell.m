#import "vaddcell.h"
#import "uicolor+uicolormain.h"

@implementation vaddcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
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
        [self setBackgroundColor:[UIColor main]];
    }
    else
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(madditem*)model
{
    self.model = model;
    [self hover];
}

@end