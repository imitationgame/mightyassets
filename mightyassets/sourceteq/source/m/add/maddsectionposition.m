#import "maddsectionposition.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];
    
    madditemorientation *modelorientation = [[madditemorientation alloc] init];
    self.modelorientation = modelorientation;
    
    madditemposition *modelposition = [[modelorientation itemselected] position];
    self.modelposition = modelposition;
    
    self.items = @[
                   modelorientation,
                   modelposition
                   ];
    
    return self;
}

@end