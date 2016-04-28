#import "maddsectionproject.h"

@implementation maddsectionproject

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_project_name", nil)];
    
    madditemprojectname *modelname = [[madditemprojectname alloc] init];
    self.modelname = modelname;
    
    madditemprojectdevices *modeldevices = [[madditemprojectdevices alloc] init];
    self.modeldevices = modeldevices;
    
    madditemprojectlanguages *modellanguages = [[madditemprojectlanguages alloc] init];
    self.modellanguages = modellanguages;
    
    self.items = @[
                   modelname,
                   modeldevices,
                   modellanguages
                   ];
    
    return self;
}

@end