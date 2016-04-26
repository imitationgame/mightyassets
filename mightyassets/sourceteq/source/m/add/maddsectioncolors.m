#import "maddsectioncolors.h"
#import "madditemcolorsbackground.h"
#import "madditemcolorsdevice.h"
#import "madditemcolorstext.h"

@implementation maddsectioncolors

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_colors_name", nil)];
    
    madditemcolorsbackground *modelbackground = [[madditemcolorsbackground alloc] init];
    self.modelbackground = modelbackground;
    
    madditemcolorsdevice *modeldevice = [[madditemcolorsdevice alloc] init];
    self.modeldevice = modeldevice;
    
    madditemcolorstext *modeltext = [[madditemcolorstext alloc] init];
    self.modeltext = modeltext;
    
    self.items = @[
                   modelbackground,
                   modeldevice,
                   modeltext
                   ];
    
    return self;
}

@end