#import "madditemposition.h"

static NSInteger const cellheight = 120;

@implementation madditemposition

-(instancetype)init:(NSString*)title
{
    self = [super init:title];
    self.height = cellheight;
    self.cellclass = [vaddcellcolor class];
    
    return self;
}

@end