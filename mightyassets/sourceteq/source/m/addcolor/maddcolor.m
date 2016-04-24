#import "maddcolor.h"

@implementation maddcolor

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    NSArray<NSDictionary*> *rawcolors = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"colors" withExtension:@"plist"]];
    NSUInteger count = rawcolors.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary<NSString*, NSNumber*> *rawcolor = rawcolors[i];
        NSNumber *red = rawcolor[@"red"];
        NSNumber *green = rawcolor[@"green"];
        NSNumber *blue = rawcolor[@"blue"];
        NSInteger redinteger = red.integerValue;
        NSInteger greeninteger = green.integerValue;
        NSInteger blueinteger = blue.integerValue;
        
        maddcoloritem *color = [[maddcoloritem alloc] init:redinteger green:greeninteger blue:blueinteger];
        [self.items addObject:color];
    }
    
    return self;
}

@end