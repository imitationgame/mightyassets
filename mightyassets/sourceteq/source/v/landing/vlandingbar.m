#import "vlandingbar.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

@implementation vlandingbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, navbarheight);
    
    return size;
}

@end