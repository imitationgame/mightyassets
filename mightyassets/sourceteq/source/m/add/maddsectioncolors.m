#import "maddsectioncolors.h"
#import "madditemcolorsbackground.h"
#import "madditemcolorsdevice.h"
#import "madditemcolorstext.h"

@implementation maddsectioncolors

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_colors_name", nil)];
    self.items = @[
                   [[madditemcolorsbackground alloc] init],
                   [[madditemcolorsdevice alloc] init],
                   [[madditemcolorstext alloc] init]
                   ];
    
    return self;
}

@end