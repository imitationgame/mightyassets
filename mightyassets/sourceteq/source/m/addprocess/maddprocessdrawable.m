#import "maddprocessdrawable.h"

@implementation maddprocessdrawable

-(instancetype)init:(NSInteger)width height:(NSInteger)height
{
    self = [super init];
    self.size = CGSizeMake(width, height);
    
    return self;
}

@end