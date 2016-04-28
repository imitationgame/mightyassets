#import "madditemcolorstext.h"

@implementation madditemcolorstext

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorstext_title", nil)];
    self.color = [UIColor colorWithWhite:0.5 alpha:1];
    
    return self;
}

@end