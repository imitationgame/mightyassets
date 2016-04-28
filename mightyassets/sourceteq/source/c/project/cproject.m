#import "cproject.h"
#import "vproject.h"
#import "cmain.h"

@interface cproject ()

@property(strong, nonatomic)vproject *view;

@end

@implementation cproject

@dynamic view;

-(instancetype)init:(mprojectitem*)model
{
    self = [super init];
    self.model = model;
    
    return self;
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

@end