#import "maddprocessdevice.h"

@implementation maddprocessdevice

-(instancetype)init:(madditempositionitem*)position sideshort:(NSInteger)sideshort sidelong:(NSInteger)sidelong fontsize:(NSInteger)fontsize
{
    self = [super init];
    self.orientation = [position orientationfor:sideshort and:sidelong];
    self.position = position;
    self.fontsize = fontsize;
    
    return self;
}

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init];
    
    return self;
}

@end