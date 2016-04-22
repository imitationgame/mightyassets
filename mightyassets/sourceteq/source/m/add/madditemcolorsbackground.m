#import "madditemcolorsbackground.h"

static NSInteger const cellheight = 80;

@implementation madditemcolorsbackground

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_colorsbackground_title", nil)];
    self.height = cellheight;
    self.selectable = YES;
    
    return self;
}

#pragma mark -
#pragma mark add item

-(void)selectedaction
{
    
}

@end