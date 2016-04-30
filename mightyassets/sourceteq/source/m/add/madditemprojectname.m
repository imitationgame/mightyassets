#import "madditemprojectname.h"
#import "vaddcellprojectname.h"

static NSInteger const cellheight = 70;

@implementation madditemprojectname

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectname_title", nil) cellclass:[vaddcellprojectname class]];
    self.height = cellheight;
    self.name = @"";
    
    return self;
}

@end