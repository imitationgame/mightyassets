#import "madditemposition.h"
#import "vaddcellposition.h"

static NSInteger const cellheight = 220;

@implementation madditemposition

-(instancetype)init:(NSString*)title
{
    self = [super init:title];
    self.height = cellheight;
    self.cellclass = [vaddcellposition class];
    self.selected = 0;
    
    return self;
}

#pragma mark public

-(madditempositionitem*)itemselected
{
    madditempositionitem *item = self.items[self.selected];
    
    return item;
}

@end