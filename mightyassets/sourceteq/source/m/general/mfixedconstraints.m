#import "mfixedconstraints.h"

@implementation mfixedconstraints

-(instancetype)init:(NSInteger)top right:(NSInteger)right bottom:(NSInteger)bottom left:(NSInteger)left
{
    self = [super init];
    self.top = @(top);
    self.right = @(right);
    self.bottom = @(bottom);
    self.left = @(left);
    
    return self;
}

@end