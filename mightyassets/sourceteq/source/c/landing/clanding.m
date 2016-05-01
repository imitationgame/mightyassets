#import "clanding.h"
#import "vlanding.h"
#import "cmain.h"

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