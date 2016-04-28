#import "madditemcolorsdevice.h"

@implementation madditemcolorsdevice

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorsdevice_title", nil)];
    self.color = [UIColor colorWithWhite:0.3 alpha:1];
    
    return self;
}

@end