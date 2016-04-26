#import "maddsectionposition.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];
    
    madditempositioniphoneportrait *modeliphoneportrait = [[madditempositioniphoneportrait alloc] init];
    self.modeliphoneportrait = modeliphoneportrait;
    
    self.items = @[
                   modeliphoneportrait
                   ];
    
    return self;
}

@end