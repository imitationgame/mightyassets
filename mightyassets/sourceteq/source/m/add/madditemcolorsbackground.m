#import "madditemcolorsbackground.h"

@implementation madditemcolorsbackground

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorsbackground_title", nil)];
    self.color = [UIColor whiteColor];
    
    return self;
}

@end