#import "madditemscreensadd.h"
#import "madditemscreensedit.h"
#import "vaddcellscreensadd.h"
#import "caddscreen.h"
#import "cmain.h"

static NSInteger const cellheight = 64;

@implementation madditemscreensadd

-(instancetype)init:(maddsectionscreens*)model
{
    self = [super init:NSLocalizedString(@"madd_item_screensadd_title", nil) cellclass:[vaddcellscreensadd class]];
    self.model = model;
    self.height = cellheight;
    self.selectable = YES;
    
    return self;
}

#pragma mark -
#pragma mark add item

-(void)selectedaction
{
    NSInteger index = self.model.items.count - 1;
    madditemscreensedit *model = [[madditemscreensedit alloc] init:index model:self.model];
    [self.model.items insertObject:model atIndex:index];
    caddscreen *controller = [[caddscreen alloc] init:model];
    [[cmain singleton] pushViewController:controller animated:YES];
}

@end