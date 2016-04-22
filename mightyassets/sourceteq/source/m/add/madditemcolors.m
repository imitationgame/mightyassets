#import "madditemcolors.h"
#import "vaddcellcolor.h"
#import "cmain.h"
#import "caddcolor.h"

static NSInteger const cellheight = 64;

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
    caddcolor *controller = [[caddcolor alloc] init:self];
    [[cmain singleton] pushViewController:controller animated:YES];
}

@end