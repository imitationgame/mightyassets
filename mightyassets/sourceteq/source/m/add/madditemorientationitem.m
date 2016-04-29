#import "madditemorientationitem.h"

@implementation madditemorientationitem

-(instancetype)init:(NSString*)name asset:(NSString*)asset
{
    self = [super init];
    self.name = name;
    self.asset = asset;
    
    return self;
}

#pragma mark public

-(madditemposition*)position
{
    return nil;
}

@end