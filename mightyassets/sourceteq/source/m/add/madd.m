#import "madd.h"
#import "maddsectionproject.h"

@implementation madd

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[maddsectionproject alloc] init]
                      ];
    
    return self;
}

@end