#import "vadd.h"

@implementation vadd

-(instancetype)init:(cadd*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

@end