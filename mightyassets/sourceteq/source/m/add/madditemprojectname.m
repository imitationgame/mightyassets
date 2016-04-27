#import "madditemprojectname.h"
#import "vaddcellprojectname.h"

static NSInteger const cellheight = 70;

@implementation madditemprojectname

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectname_title", nil)];
    self.height = cellheight;
    self.name = @"";
    self.cellclass = [vaddcellprojectname class];
    
    return self;
}

@end