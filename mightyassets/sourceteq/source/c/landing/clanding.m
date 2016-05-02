#import "clanding.h"
#import "vlanding.h"
#import "cmain.h"
#import "analytics.h"

@interface clanding ()

@property(strong, nonatomic)vlanding *view;

@end

@implementation clanding

@dynamic view;

-(void)loadView
{
    self.view = [[vlanding alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [[analytics singleton] trackscreen:self];
}

#pragma mark public

-(void)addproject
{
    [[cmain singleton].pages page_add];
}

-(void)openproject:(mprojectitem*)model
{
    [[cmain singleton].pages page_project:model];
}

@end