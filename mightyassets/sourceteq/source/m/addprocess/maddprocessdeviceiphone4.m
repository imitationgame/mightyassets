#import "maddprocessdeviceiphone4.h"

static NSInteger const sideshort = 640;
static NSInteger const sidelong = 960;
static NSInteger const fontsize = 40;

@implementation maddprocessdeviceiphone4

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    
    return self;
}

@end