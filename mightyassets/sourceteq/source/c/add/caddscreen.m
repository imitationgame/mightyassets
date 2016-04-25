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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.prevgesturedelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self.prevgesturedelegate;
}

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end