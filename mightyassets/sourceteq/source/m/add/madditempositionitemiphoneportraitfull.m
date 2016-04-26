#import "madditempositionitemiphoneportraitfull.h"
#import "maddprocessorientationportrait.h"

@implementation madditempositionitemiphoneportraitfull

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positioniphoneportraitfull_title", nil) asset:@"add_positionfull_iphoneportrait"];
    
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