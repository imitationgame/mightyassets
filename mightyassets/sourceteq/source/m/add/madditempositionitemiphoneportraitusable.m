#import "madditempositionitemiphoneportraitusable.h"
#import "maddprocessorientationportrait.h"

@implementation madditempositionitemiphoneportraitusable

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positioniphoneportraitusable_title", nil) asset:@"add_positionusable_iphoneportrait"];
    
    return self;
}

#pragma mark -
#pragma mark position item

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    maddprocessorientation *orientation = [[maddprocessorientation alloc] init:sideshort sidelong:sidelong];
    
    return orientation;
}

@end