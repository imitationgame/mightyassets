#import "maddprocessorientationlandscape.h"

@implementation maddprocessorientationlandscape

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.width = sidelong;
    self.height = sideshort;
    
    return self;
}

@end