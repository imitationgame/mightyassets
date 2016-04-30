#import "madditem.h"
#import "vaddcell.h"

@implementation madditem

-(instancetype)init:(NSString*)title cellclass:(Class)cellclass
{
    self = [super init];
    self.cellclass = cellclass;
    self.cellclassname = NSStringFromClass(cellclass);
    self.title = title;
    self.selectable = NO;
    
    return self;
}

#pragma mark public

-(void)selectedaction
{
    
}

@end