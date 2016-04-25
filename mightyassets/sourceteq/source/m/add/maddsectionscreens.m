#import "maddsectionscreens.h"

@implementation maddsectionscreens

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_screens_name", nil)];
    self.items = @[
                   [[madditempositioniphoneportrait alloc] init]
                   ];
    
    return self;
}


@end