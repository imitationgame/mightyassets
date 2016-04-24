#import "maddcoloritem.h"

@implementation maddcoloritem

-(instancetype)init:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue
{
    self = [super init];
    self.red = red;
    self.green = green;
    self.blue = blue;
    self.color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
    
    return self;
}

@end