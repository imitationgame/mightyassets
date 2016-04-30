#import "maddcoloradd.h"
#import "maddcoloradditemred.h"
#import "maddcoloradditemgreen.h"
#import "maddcoloradditemblue.h"

@implementation maddcoloradd

-(instancetype)init
{
    self = [super init];
    
    maddcoloradditemred *red = [[maddcoloradditemred alloc] init];
    self.red = red;
    
    maddcoloradditemred *green = [[maddcoloradditemgreen alloc] init];
    self.blue = green;
    
    maddcoloradditemred *blue = [[maddcoloradditemblue alloc] init];
    self.blue = blue;
    
    self.items = @[red, green, blue];
    
    return self;
}

@end