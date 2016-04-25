#import "madditemscreensedit.h"
#import "vaddcellscreensedit.h"

static NSInteger const cellheight = 60;

@implementation madditemscreensedit

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_screensedit_title", nil)];
    self.height = cellheight;
    self.cellclass = [vaddcellscreensedit class];
    
    return self;
}

@end