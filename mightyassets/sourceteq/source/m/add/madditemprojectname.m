#import "madditemprojectname.h"

static NSInteger const cellheight = 100;

@implementation madditemprojectname

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectname_title", nil)];
    self.height = cellheight;
    
    return self;
}

@end