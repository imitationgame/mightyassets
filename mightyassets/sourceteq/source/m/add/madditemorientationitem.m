#import "madditemorientationitem.h"
#import "madditemorientation.h"

@implementation madditemorientationitem

-(instancetype)init:(madditemorientation*)orientation
{
    return nil;
}

-(instancetype)init:(madditemorientation*)orientation name:(NSString*)name asset:(NSString*)asset
{
    self = [super init];
    self.orientation = orientation;
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