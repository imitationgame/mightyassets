#import "madditemcolorstext.h"

@implementation madditemcolorstext

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorstext_title", nil)];
    self.color = [UIColor blackColor];
    
    return self;
}

@end