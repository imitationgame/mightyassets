#import "maddprocessdrawablescreen.h"

@implementation maddprocessdrawablescreen

-(instancetype)init:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    self = [super init];
    self.rect = CGRectMake(x, y, width, height);
    
    return self;
}

@end