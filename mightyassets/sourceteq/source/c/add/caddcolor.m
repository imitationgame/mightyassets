#import "caddcolor.h"
#import "vaddcolor.h"
#import "caddcoloradd.h"
#import "analytics.h"

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

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [[analytics singleton] trackscreen:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.prevgesturedelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    if(!self.view.collection)
    {
        [self.view viewappear];
    }
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

-(void)changecolor:(UIColor*)color
{
    self.model.color = color;
    [self back];
}

-(void)add
{
    caddcoloradd *controller = [[caddcoloradd alloc] init:self.model];
    [self.navigationController pushViewController:controller animated:YES];
}

@end