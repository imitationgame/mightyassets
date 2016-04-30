#import "madditemscreensedit.h"
#import "vaddcellscreensedit.h"
#import "caddscreen.h"
#import "cmain.h"

static NSInteger const cellheight = 110;

@implementation madditemscreensedit

-(instancetype)init:(NSInteger)index model:(maddsectionscreens*)model
{
    self = [super init:NSLocalizedString(@"madd_item_screensedit_title", nil) cellclass:[vaddcellscreensedit class]];
    self.model = model;
    self.index = index;
    self.height = cellheight;
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

-(NSInteger)titlescompleted
{
    NSInteger count = 0;
    
    for(madditemscreensedittitle *title in self.titles)
    {
        if(title.title.length)
        {
            count++;
        }
    }
    
    return count;
}

@end