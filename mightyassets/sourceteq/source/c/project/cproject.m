#import "cproject.h"
#import "vproject.h"
#import "cmain.h"
#import "analytics.h"

@implementation cproject

@dynamic view;

-(instancetype)init:(mprojectitem*)model
{
    self = [super init];
    self.model = model;
    
    return self;
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
    
    if(!self.view.pics)
    {
        [self.view loadpics];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view clean];
}

-(void)loadView
{
    self.view = [[vproject alloc] init:self];
}

#pragma mark public

-(void)back
{
    [[cmain singleton].pages page_landing:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

-(void)deleteproject
{
    [self.model remove];
}

@end