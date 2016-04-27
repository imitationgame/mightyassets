#import "vaddfontbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "genericconstants.h"

@implementation vaddfontbar

-(instancetype)init:(caddfont*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor main]];
    [self setClipsToBounds:YES];
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