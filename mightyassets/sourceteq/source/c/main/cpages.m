#import "cpages.h"
#import "clanding.h"
#import "cadd.h"
#import "caddprocess.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self page_landing:UIPageViewControllerNavigationDirectionForward animated:NO];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

#pragma mark public

-(void)page_landing:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    clanding *controller = [[clanding alloc] init];
    [self changecontroller:controller direction:direction animated:animated];
}

-(void)page_add
{
    cadd *controller = [[cadd alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

-(void)page_addprocess:(madd*)model
{
    caddprocess *controller = [[caddprocess alloc] init:model];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

@end