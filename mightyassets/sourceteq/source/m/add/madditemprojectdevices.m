#import "madditemprojectdevices.h"

static NSInteger const cellheight = 80;

@implementation madditemprojectdevices

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_title", nil)];
    self.height = cellheight;
    
    return self;
}

@end