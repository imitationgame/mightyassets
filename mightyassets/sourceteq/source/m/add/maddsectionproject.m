#import "maddsectionproject.h"
#import "madditemprojectname.h"
#import "madditemprojectdevices.h"

@implementation maddsectionproject

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_project_name", nil)];
    
    madditemprojectlanguages *languages = [[madditemprojectlanguages alloc] init];
    self.modellanguages = languages;
    
    self.items = @[
                   [[madditemprojectname alloc] init],
                   [[madditemprojectdevices alloc] init],
                   languages
                   ];
    
    return self;
}

@end