#import "madditemtitlesfont.h"
#import "vaddcelltitlesfont.h"

static NSInteger const cellheight = 64;

@implementation madditemtitlesfont

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_titlesfont_title", nil)];
    self.height = cellheight;
    self.cellclass = [vaddcelltitlesfont class];
    
    return self;
}

@end