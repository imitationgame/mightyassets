#import "madditempositionlandscape.h"
#import "madditempositionlandscapedown.h"
#import "madditempositionlandscapemargin.h"

@implementation madditempositionlandscape

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionlandscape_title", nil)];
    
    self.items = @[
                   [[madditempositionlandscapemargin alloc] init],
                   [[madditempositionlandscapedown alloc] init],
                   ];
    
    return self;
}

@end