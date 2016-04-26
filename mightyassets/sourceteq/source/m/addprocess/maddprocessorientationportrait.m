#import "maddprocessorientationportrait.h"

static CGFloat const rotationradians = 0;

@implementation maddprocessorientationportrait

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.width = sideshort;
    self.height = sidelong;
    self.rotation = rotationradians;
    
    return self;
}

@end