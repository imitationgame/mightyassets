#import "maddsectionposition.h"
#import "madditempositioniphoneportrait.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];
    self.items = @[
                   [[madditempositioniphoneportrait alloc] init]
                   ];
    
    return self;
}

@end