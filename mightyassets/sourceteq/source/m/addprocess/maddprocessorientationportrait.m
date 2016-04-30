#import "maddprocessorientationportrait.h"

@implementation maddprocessorientationportrait

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.width = sideshort;
    self.height = sidelong;
    
    return self;
}

@end