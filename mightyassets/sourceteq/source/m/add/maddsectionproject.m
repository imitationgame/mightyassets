#import "maddsectionproject.h"
#import "madditemprojectname.h"

@implementation maddsectionproject

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_project_name", nil)];
    self.items = @[
                   [[madditemprojectname alloc] init]
                   ];
    
    return self;
}

@end