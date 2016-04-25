#import "vaddscreenbar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

@implementation vaddscreenbar

-(instancetype)init:(caddscreen*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, navbarheight);
    
    return size;
}

@end