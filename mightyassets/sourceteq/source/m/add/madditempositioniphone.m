#import "madditempositioniphone.h"

static NSInteger const cellheight = 120;

@implementation madditempositioniphone

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_title", nil)];
    self.height = cellheight;
    
    return self;
}

@end