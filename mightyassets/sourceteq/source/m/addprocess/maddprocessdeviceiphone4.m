#import "maddprocessdeviceiphone4.h"

static NSString
static NSInteger const sideshort = 640;
static NSInteger const sidelong = 960;

@implementation maddprocessdeviceiphone4

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong];
    
    return self;
}

@end