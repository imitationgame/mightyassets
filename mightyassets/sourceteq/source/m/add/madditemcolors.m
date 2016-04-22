#import "madditemcolors.h"
#import "vaddcellcolor.h"

static NSInteger const cellheight = 60;

@implementation madditemcolors

-(instancetype)init:(NSString*)title
{
    self = [super init:title];
    self.height = cellheight;
    self.selectable = YES;
    self.cellclass = [vaddcellcolor class];
    
    return self;
}

#pragma mark -
#pragma mark add item

-(void)selectedaction
{
    
}

@end