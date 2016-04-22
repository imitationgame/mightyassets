#import "madditem.h"

@implementation madditem

-(instancetype)init:(NSString*)title
{
    self = [super init];
    self.title = title;
    
    return self;
}

@end