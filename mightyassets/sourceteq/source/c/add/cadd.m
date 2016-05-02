#import "cadd.h"
#import "vadd.h"
#import "cmain.h"
#import "analytics.h"

@interface cadd ()

@property(strong, nonatomic)vadd *view;

@end

@implementation cadd

@dynamic view;

-(void)loadView
{
    self.view = [[vadd alloc] init:self];
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
    [self.view.collection reloadData];
}

#pragma mark public

-(void)cancel
{
    [[cmain singleton].pages page_landing:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

-(void)next
{
    [[cmain singleton].pages page_addprocess:self.view.model];
}

@end