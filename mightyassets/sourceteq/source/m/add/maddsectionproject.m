#import "maddsectionproject.h"
#import "madditemprojectname.h"
#import "madditemprojectdevices.h"
#import "madditemprojectlanguages.h"

@implementation maddsectionproject

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_project_name", nil)];
    self.items = @[
                   [[madditemprojectname alloc] init],
                   [[madditemprojectdevices alloc] init],
                   [[madditemprojectlanguages alloc] init]
                   ];
    
    return self;
}

@end