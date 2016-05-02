#import "maddprocessassetiphone6.h"

static NSString* const assetname = @"device_portrait_iphone6";
static NSString* const assetnamecam = @"device_portrait_iphone6_cam";
static NSInteger const imagewidth = 865;
static NSInteger const imageheight = 1764;
static NSInteger const screenx = 50;
static NSInteger const screeny = 209;
static NSInteger const screenwidth = 764;
static NSInteger const screenheight = 1348;
static NSInteger const devicescreenwidth = 750;
static NSInteger const devicescreenheight = 1334;

@implementation maddprocessassetiphone6

-(instancetype)init
{
    self = [super init];
    self.assetname = assetname;
    self.assetnamecam = assetnamecam;
    self.imagewidth = imagewidth;
    self.imageheight = imageheight;
    self.screenx = screenx;
    self.screeny = screeny;
    self.screenwidth = screenwidth;
    self.screenheight = screenheight;
    self.devicescreenwidth = devicescreenwidth;
    self.devicescreenheight = devicescreenheight;
    
    return self;
}

@end