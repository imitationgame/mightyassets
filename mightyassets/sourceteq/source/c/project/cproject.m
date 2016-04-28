#import "cproject.h"
#import "vproject.h"

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

@end