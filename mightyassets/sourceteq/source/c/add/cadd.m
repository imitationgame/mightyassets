#import "cadd.h"
#import "vadd.h"

@interface cadd ()

@property(strong, nonatomic)vadd *view;

@end

@implementation cadd

@dynamic view;

-(void)loadView
{
    self.view = [[vadd alloc] init:self];
}

@end