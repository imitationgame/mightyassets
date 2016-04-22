#import "madd.h"
#import "maddsectionproject.h"
#import "maddsectioncolors.h"

@implementation madd

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[maddsectionproject alloc] init],
                      [[maddsectioncolors alloc] init]
                      ];
    
    return self;
}

@end