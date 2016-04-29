#import "maddsectionposition.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];
    
    madditemorientation *modelorientation = [[madditemorientation alloc] init];
    self.modelorientation = modelorientation;
    
    madditempositioniphoneportrait *modelposition = [[madditempositioniphoneportrait alloc] init];
    self.modelposition = modelposition;
    
    self.items = @[
                   modeliphoneportrait
                   ];
    
    return self;
}

@end