#import "madditemframe.h"
#import "madditemframeitemiphone6.h"
#import "vaddcellframe.h"

static NSInteger const cellheight = 150;

@implementation madditemframe

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_frame_title", nil)];
    self.height = cellheight;
    self.cellclass = [vaddcellframe class];
    self.selected = 0;
    self.items = @[
                   [[madditemframeitemiphone6 alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(madditemframeitem*)itemselected
{
    madditemframeitem *item = self.items[self.selected];
    
    return item;
}

@end