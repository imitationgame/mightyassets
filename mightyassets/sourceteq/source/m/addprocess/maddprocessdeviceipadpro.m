#import "maddprocessdeviceipadpro.h"

static NSString* const name = @"ipad_pro";
static NSInteger const sideshort = 2732;
static NSInteger const sidelong = 2048;
static NSInteger const fontsize = 120;

@implementation maddprocessdeviceipadpro

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    self.name = name;
    
    return self;
}

@end