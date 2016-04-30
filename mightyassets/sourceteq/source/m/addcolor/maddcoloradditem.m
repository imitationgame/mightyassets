#import "maddcoloradditem.h"

@implementation maddcoloradditem

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    self.value = 0;
    
    return self;
}

@end