#import "madditemposition.h"
#import "vaddcellposition.h"

static NSInteger const cellheight = 165;

@implementation madditemposition

-(instancetype)init:(NSString*)title
{
    self = [super init:title cellclass:[vaddcellposition class]];
    self.height = cellheight;
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