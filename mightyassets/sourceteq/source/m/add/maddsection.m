#import "maddsection.h"

@implementation maddsection

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    
    return self;
}

@end