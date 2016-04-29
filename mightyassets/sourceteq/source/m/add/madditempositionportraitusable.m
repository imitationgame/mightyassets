#import "madditempositionportraitusable.h"
#import "maddprocessorientationportrait.h"

static NSInteger const percenttop = 5;
static NSInteger const percentbottom = 0;

@implementation madditempositionportraitusable

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionportraitusable_title", nil) asset:@"add_positionusable_iphoneportrait"];
    self.percenttop = percenttop;
    self.percentbottom = percentbottom;
    
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