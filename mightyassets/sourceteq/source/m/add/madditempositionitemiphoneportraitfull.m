#import "madditempositionitemiphoneportraitfull.h"
#import "maddprocessorientationportrait.h"

@implementation madditempositionitemiphoneportraitfull

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positioniphoneportraitfull_title", nil) asset:@"add_positionfull_iphoneportrait"];
    self.percenttop = 30;
    self.percentbottom = 5;
    
    return self;
}

#pragma mark -
#pragma mark position item

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    maddprocessorientationportrait *orientation = [[maddprocessorientationportrait alloc] init:sideshort sidelong:sidelong];
    
    return orientation;
}

-(NSInteger)visiblewidthfor:(maddprocessasset*)asset
{
    NSInteger visiblewidth = asset.imagewidth;
    
    return visiblewidth;
}

-(NSInteger)visibleheightfor:(maddprocessasset*)asset
{
    NSInteger visibleheight = asset.imageheight;
    
    return visibleheight;
}

@end