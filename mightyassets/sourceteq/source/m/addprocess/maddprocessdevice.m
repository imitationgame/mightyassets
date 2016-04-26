#import "maddprocessdevice.h"

@implementation maddprocessdevice

-(instancetype)init:(maddprocessorientation*)orientation position:(madditempositionitem*)position
{
    self = [super init];
    self.orientation = orientation;
    self.position = position;
    
    return self;
}

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init];
    
    return self;
}

@end