#import "maddprocessdeviceiphone5.h"

static NSString* const name = @"4-inch";
static NSInteger const sideshort = 640;
static NSInteger const sidelong = 1136;
static NSInteger const fontsize = 40;

@implementation maddprocessdeviceiphone5

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    self.name = name;
    
    return self;
}

@end