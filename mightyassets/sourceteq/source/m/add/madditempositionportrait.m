#import "madditempositionportrait.h"
#import "madditempositionportraitfull.h"
#import "madditempositionportraitusable.h"

@implementation madditempositionportrait

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionportrait_title", nil)];
    
    self.items = @[
                   [[madditempositionportraitusable alloc] init],
                   [[madditempositionportraitfull alloc] init],
                   ];
    
    return self;
}

@end