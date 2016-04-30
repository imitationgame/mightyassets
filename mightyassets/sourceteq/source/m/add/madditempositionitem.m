#import "madditempositionitem.h"

@implementation madditempositionitem

-(instancetype)init:(NSString*)name asset:(NSString*)asset
{
    self = [super init];
    self.name = name;
    self.asset = asset;
    
    return self;
}

#pragma mark public

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    return nil;
}

-(NSInteger)extrudetop:(maddprocessassetoriented*)asset
{
    return 0;
}

@end