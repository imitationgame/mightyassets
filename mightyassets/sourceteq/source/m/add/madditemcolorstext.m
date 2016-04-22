#import "madditemcolorstext.h"
#import "uicolor+uicolormain.h"

@implementation madditemcolorstext

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorstext_title", nil)];
    self.color = [UIColor main];
    
    return self;
}

@end