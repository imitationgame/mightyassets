#import "caddscreen.h"
#import "vaddscreen.h"

@interface caddscreen ()

@property(strong, nonatomic)vaddscreen *view;

@end

@implementation caddscreen

@dynamic view;

-(instancetype)init:(madditemscreensedit*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vaddscreen alloc] init:self];
}

@end