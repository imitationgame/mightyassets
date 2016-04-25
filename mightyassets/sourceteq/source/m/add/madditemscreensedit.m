#import "madditemscreensedit.h"
#import "vaddcellscreensedit.h"
#import "caddscreen.h"
#import "cmain.h"

static NSInteger const cellheight = 140;

@implementation madditemscreensedit

-(instancetype)init:(NSInteger)index model:(maddsectionscreens*)model
{
    self = [super init:NSLocalizedString(@"madd_item_screensedit_title", nil)];
    self.model = model;
    self.index = index;
    self.height = cellheight;
    self.cellclass = [vaddcellscreensedit class];
    self.selectable = YES;
    self.titles = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark add item

-(void)selectedaction
{
    caddscreen *controller = [[caddscreen alloc] init:self];
    [[cmain singleton] pushViewController:controller animated:YES];
}

@end