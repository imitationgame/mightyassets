#import "vaddcoloraddfooter.h"

@implementation vaddcoloraddfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

-(void)config:(caddcoloradd*)controller
{
    self.controller = controller;
}

@end