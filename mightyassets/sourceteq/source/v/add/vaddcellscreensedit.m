#import "vaddcellscreensedit.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vaddcellscreensedit

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark functionality

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

@end