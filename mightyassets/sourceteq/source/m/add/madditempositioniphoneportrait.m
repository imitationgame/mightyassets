#import "madditempositioniphoneportrait.h"
#import "madditempositionitemiphoneportraitusable.h"
#import "madditempositionitemiphoneportraitfull.h"

@implementation madditempositioniphoneportrait

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positioniphoneportrait_title", nil)];
    self.items = @[
                   [[madditempositionitemiphoneportraitusable alloc] init],
                   [[madditempositionitemiphoneportraitfull alloc] init],
                   ];
    
    return self;
}

@end