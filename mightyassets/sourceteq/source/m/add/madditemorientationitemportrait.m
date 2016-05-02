#import "madditemorientationitemportrait.h"
#import "madditempositionportrait.h"

@implementation madditemorientationitemportrait

-(instancetype)init:(madditemorientation*)orientation
{
    self = [super init:orientation name:NSLocalizedString(@"madd_item_orientation_portrait_title", nil) asset:@"add_orientation_portrait"];
    
    return self;
}

#pragma mark -
#pragma mark orientation

-(madditemposition*)position
{
    madditempositionportrait *position = [[madditempositionportrait alloc] init];
    
    return position;
}

-(maddprocessassetoriented*)assetoriented:(maddprocessasset*)asset
{
    maddprocessassetoriented *oriented = [[maddprocessassetoriented alloc] init];
    oriented.image = [UIImage imageNamed:asset.assetname];
    oriented.imagecam = [UIImage imageNamed:asset.assetnamecam];
    oriented.imagewidth = asset.imagewidth;
    oriented.imageheight = asset.imageheight;
    oriented.screenx = asset.screenx;
    oriented.screeny = asset.screeny;
    oriented.screenwidth = asset.screenwidth;
    oriented.screenheight = asset.screenheight;
    oriented.devicescreenwidth = asset.devicescreenwidth;
    oriented.devicescreenheight = asset.devicescreenheight;
    
    return oriented;
}

@end