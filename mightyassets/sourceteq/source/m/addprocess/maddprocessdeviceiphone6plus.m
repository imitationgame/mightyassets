#import "maddprocessdeviceiphone6plus.h"

static NSString* const name = @"5_5-inch";
static NSInteger const sideshort = 1242;
static NSInteger const sidelong = 2208;
static NSInteger const fontsize = 80;

@implementation maddprocessdeviceiphone6plus

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    self.name = name;
    
    return self;
}

@end