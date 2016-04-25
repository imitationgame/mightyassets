#import "madditempositionitem.h"

@implementation madditempositionitem

-(instancetype)init:(NSString*)name asset:(NSString*)asset
{
    self = [super init];
    self.name = name;
    self.asset = asset;
    
    return self;
}

@end