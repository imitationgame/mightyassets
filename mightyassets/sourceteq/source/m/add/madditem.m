#import "madditem.h"
#import "vaddcell.h"

@implementation madditem

-(instancetype)init:(NSString*)title
{
    self = [super init];
    self.cellclassname = NSStringFromClass(self.class);
    self.title = title;
    self.selectable = NO;
    self.cellclass = [vaddcell class];
    
    return self;
}

#pragma mark public

-(void)selectedaction
{
    
}

@end