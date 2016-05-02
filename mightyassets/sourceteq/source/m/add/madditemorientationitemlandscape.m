#import "madditemorientationitemlandscape.h"
#import "madditempositionlandscape.h"

@implementation madditemorientationitemlandscape

-(instancetype)init:(madditemorientation*)orientation
{
    self = [super init:orientation name:NSLocalizedString(@"madd_item_orientation_landscape_title", nil) asset:@"add_orientation_landscape"];
    
    return self;
}

#pragma mark functionality

-(UIImage*)imagerotated:(NSString*)asset
{
    UIImage *original = [UIImage imageNamed:asset];
    UIImage *rotated = [UIImage imageWithCGImage:original.CGImage scale:1 orientation:UIImageOrientationLeft];
    
    return rotated;
}

#pragma mark -
#pragma mark orientation

-(madditemposition*)position
{
    madditempositionlandscape *position = [[madditempositionlandscape alloc] init];
    
    return position;
}

-(maddprocessassetoriented*)assetoriented:(maddprocessasset*)asset
{
    maddprocessassetoriented *oriented = [[maddprocessassetoriented alloc] init];
    oriented.image = [self imagerotated:asset.assetname];
    oriented.imagecam = [self imagerotated:asset.assetnamecam];
    oriented.imagewidth = asset.imageheight;
    oriented.imageheight = asset.imagewidth;
    oriented.screenx = asset.screeny;
    oriented.screeny = asset.imagewidth - (asset.screenx + asset.screenwidth);
    oriented.screenwidth = asset.screenheight;
    oriented.screenheight = asset.screenwidth;
    oriented.devicescreenwidth = asset.devicescreenheight;
    oriented.devicescreenheight = asset.devicescreenwidth;
    
    return oriented;
}

@end