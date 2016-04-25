#import "madditemscreensadd.h"
#import "vaddcellscreensadd.h"

static NSInteger const cellheight = 60;

@implementation madditemscreensadd

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_screensadd_title", nil)];
    self.height = cellheight;
    self.cellclass = [vaddcellscreensadd class];
    
    return self;
}

@end