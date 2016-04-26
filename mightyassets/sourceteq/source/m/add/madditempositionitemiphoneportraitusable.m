#import "madditempositionitemiphoneportraitusable.h"
#import "maddprocessorientationportrait.h"

@implementation madditempositionitemiphoneportraitusable

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positioniphoneportraitusable_title", nil) asset:@"add_positionusable_iphoneportrait"];
    self.percenttop = 10;
    self.percentbottom = 0;
    
    return self;
}

#pragma mark -
#pragma mark position item

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    maddprocessorientationportrait *orientation = [[maddprocessorientationportrait alloc] init:sideshort sidelong:sidelong];
    
    return orientation;
}

-(NSInteger)extrudetop:(maddprocessasset*)asset
{
    NSInteger extrudetop = asset.imageheight - (asset.screeny + asset.screenheight);
    
    return extrudetop;
}

@end