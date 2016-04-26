#import "maddprocessorientationlandscape.h"

static CGFloat const rotationradians = 1.5708;

@implementation maddprocessorientationlandscape

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.width = sidelong;
    self.height = sideshort;
    self.rotation = rotationradians;
    
    return self;
}

@end