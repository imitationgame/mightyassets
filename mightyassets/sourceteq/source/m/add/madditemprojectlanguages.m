#import "madditemprojectlanguages.h"
#import "vaddcellprojectlanguages.h"

static NSInteger const initialquantity = 1;
static NSInteger const cellheight = 100;

@implementation madditemprojectlanguages

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectlanguages_title", nil) cellclass:[vaddcellprojectlanguages class]];
    self.height = cellheight;
    self.quantity = initialquantity;
    
    return self;
}

@end