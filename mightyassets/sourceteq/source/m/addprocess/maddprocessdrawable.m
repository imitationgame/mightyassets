#import "maddprocessdrawable.h"

@implementation maddprocessdrawable

-(instancetype)init:(NSInteger)width height:(NSInteger)height
{
    self = [super init];
    self.rect = CGRectMake(0, 0, width, height);
    
    return self;
}

@end