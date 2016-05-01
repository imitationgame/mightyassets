#import "caddcoloradd.h"
#import "vaddcoloradd.h"

@interface caddcoloradd ()

@property(strong, nonatomic)vaddcoloradd *view;

@end

@implementation caddcoloradd

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
    self.view = [[vaddcoloradd alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)changecolor:(UIColor*)color
{
    self.model.color = color;
    
    NSArray<UIViewController*> *controllers = self.navigationController.viewControllers;
    NSInteger count = controllers.count;
    UIViewController *prevcontroller = controllers[count - 2];
    
    [self.navigationController popToViewController:prevcontroller animated:YES];
}
@end