#import "maddprocessdeviceiphone6.h"

static NSString* const name = @"4_7-inch";
static NSInteger const sideshort = 750;
static NSInteger const sidelong = 1334;
static NSInteger const fontsize = 50;

@implementation maddprocessdeviceiphone6

-(instancetype)init:(madditempositionitem*)position
{
    self = [super init:position sideshort:sideshort sidelong:sidelong fontsize:fontsize];
    self.name = name;
    
    return self;
}

@end