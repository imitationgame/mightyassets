#import "clanding.h"
#import "vlanding.h"

@interface clanding ()

@property(strong, nonatomic)vlanding *view;

@end

@implementation clanding

@dynamic view;

-(void)loadView
{
    self.view = [[vlanding alloc] init:self];
}

@end