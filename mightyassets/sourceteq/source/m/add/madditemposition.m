#import "madditemposition.h"
#import "vaddcellposition.h"

static NSInteger const cellheight = 150;

@implementation madditemposition

-(instancetype)init:(NSString*)title
{
    self = [super init:title];
    self.height = cellheight;
    self.cellclass = [vaddcellposition class];
    
    return self;
}

@end