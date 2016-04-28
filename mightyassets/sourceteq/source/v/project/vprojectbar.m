#import "vprojectbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static NSInteger const height = 150;

@implementation vprojectbar

-(instancetype)init:(cproject*)controller
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
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

@end
