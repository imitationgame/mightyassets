#import "madditem.h"

@implementation madditem

-(instancetype)init:(NSString*)title
{
    self = [super init];
    self.title = title;
    self.selectable = NO;
    
    return self;
}

#pragma mark public

-(void)selectedaction
{
    
}

@end