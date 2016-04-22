#import "caddcolor.h"
#import "vaddcolor.h"

@interface caddcolor ()

@property(strong, nonatomic)vaddcolor *view;

@end

@implementation caddcolor

@dynamic view;

-(instancetype)init:(madditemcolors*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vaddcolor alloc] init:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
#warning "test on iphone 4"
    
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
}

@end