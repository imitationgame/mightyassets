#import "madditemframeitem.h"

@implementation madditemframeitem

-(instancetype)init:(NSString*)name asset:(NSString*)asset
{
    self = [super init];
    self.name = name;
    self.asset = asset;
    
    return self;
}

#pragma mark public

-(maddprocessasset*)asset
{
    return nil;
}

@end