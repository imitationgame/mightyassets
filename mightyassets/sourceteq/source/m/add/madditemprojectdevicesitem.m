#import "madditemprojectdevicesitem.h"

@implementation madditemprojectdevicesitem

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    
    return self;
}

#pragma mark public

-(NSArray<maddprocessdevice*>*)devices:(madditempositionitem*)position
{
    return nil;
}

@end