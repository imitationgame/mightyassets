#import "madditemorientationitemportrait.h"
#import "madditempositionportrait.h"

@implementation madditemorientationitemportrait

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_orientation_portrait_title", nil) asset:@"add_orientation_portrait"];
    
    return self;
}

#pragma mark -
#pragma mark orientation

-(madditemposition*)position
{
    madditempositionportrait *position = [[madditempositionportrait alloc] init];
    
    return position;
}

@end