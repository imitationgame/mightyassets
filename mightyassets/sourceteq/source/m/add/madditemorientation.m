#import "madditemorientation.h"
#import "madditemorientationitemportrait.h"
#import "madditemorientationitemlandscape.h"
#import "vaddcellorientation.h"
#import "maddsectionposition.h"

static NSInteger const cellheight = 90;

@implementation madditemorientation

-(instancetype)init:(maddsectionposition*)position
{
    self = [super init:NSLocalizedString(@"madd_item_orientation_title", nil)];
    self.position = position;
    self.height = cellheight;
    self.cellclass = [vaddcellorientation class];
    self.selected = 0;
    self.items = @[
                   [[madditemorientationitemportrait alloc] init:self],
                   [[madditemorientationitemlandscape alloc] init:self]
                   ];
    
    return self;
}

#pragma mark public

-(madditemorientationitem*)itemselected
{
    madditemorientationitem *item = self.items[self.selected];
    
    return item;
}

-(void)changeselected:(NSInteger)selected
{
    self.selected = selected;
    madditemposition *modelposition = [[self itemselected] position];
    [self.position changeposition:modelposition];
}

@end