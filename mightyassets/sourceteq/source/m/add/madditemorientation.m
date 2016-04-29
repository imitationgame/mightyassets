#import "madditemorientation.h"
#import "madditemorientationitemportrait.h"
#import "madditemorientationitemlandscape.h"
#import "vaddcellorientation.h"

static NSInteger const cellheight = 150;

@implementation madditemorientation

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_orientation_title", nil)];
    self.height = cellheight;
    self.cellclass = [vaddcellorientation class];
    self.selected = 0;
    self.items = @[
                   [[madditemorientationitemportrait alloc] init],
                   [[madditemorientationitemlandscape alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(madditemorientationitem*)itemselected
{
    madditemorientationitem *item = self.items[self.selected];
    
    return item;
}

@end