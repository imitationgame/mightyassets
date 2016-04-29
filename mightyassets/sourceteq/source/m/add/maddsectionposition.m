#import "maddsectionposition.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];

    madditemframe *modelframe = [[madditemframe alloc] init];
    self.modelframe = modelframe;
    
    madditemorientation *modelorientation = [[madditemorientation alloc] init];
    self.modelorientation = modelorientation;
    
    madditemposition *modelposition = [[modelorientation itemselected] position];
    self.modelposition = modelposition;
    
    self.items = @[
                   modelframe,
                   modelorientation,
                   modelposition
                   ];
    
    return self;
}

@end