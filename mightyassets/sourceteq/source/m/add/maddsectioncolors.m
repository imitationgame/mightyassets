#import "maddsectioncolors.h"
#import "madditemcolorsbackground.h"

@implementation maddsectioncolors

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_colors_name", nil)];
    self.items = @[
                   [[madditemcolorsbackground alloc] init]
                   ];
    
    return self;
}

@end