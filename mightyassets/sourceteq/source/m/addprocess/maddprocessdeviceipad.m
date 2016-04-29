#import "maddprocessdeviceipad.h"

static NSString* const name = @"ipad";
static NSInteger const sideshort = 1536;
static NSInteger const sidelong = 2048;
static NSInteger const fontsize = 80;

@implementation maddprocessdeviceipad

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    self.name = name;
    
    return self;
}

@end