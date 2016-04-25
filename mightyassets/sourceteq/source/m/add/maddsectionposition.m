#import "maddsectionposition.h"
#import "madditempositioniphone.h"

@implementation maddsectionposition

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];
    self.items = @[
                   [[madditempositioniphone alloc] init]
                   ];
    
    return self;
}

@end