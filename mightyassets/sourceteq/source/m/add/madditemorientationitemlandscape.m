#import "madditemorientationitemlandscape.h"
#import "madditempositionlandscape.h"

@implementation madditemorientationitemlandscape

-(instancetype)init:(madditemorientation*)orientation
{
    self = [super init:orientation name:NSLocalizedString(@"madd_item_orientation_landscape_title", nil) asset:@"add_orientation_landscape"];
    
    return self;
}

#pragma mark -
#pragma mark orientation

-(madditemposition*)position
{
    madditempositionlandscape *position = [[madditempositionlandscape alloc] init];
    
    return position;
}

@end