#import "madditemcolorsdevice.h"
#import "uicolor+uicolormain.h"

@implementation madditemcolorsdevice

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorsdevice_title", nil)];
    self.color = [UIColor second];
    
    return self;
}

@end