#import "maddprocessdevice.h"

@implementation maddprocessdevice

-(instancetype)init:(madditempositionitem*)position sideshort:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.orientation = [position orientationfor:sideshort and:sidelong];
    self.position = position;
    
    return self;
}

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init];
    
    return self;
}

@end