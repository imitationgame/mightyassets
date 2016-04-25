#import "uicolor+uicolormain.h"

@implementation UIColor (uicolormain)

+(instancetype)main
{
    return [UIColor colorWithRed:0.95294 green:0.12941 blue:0.16078 alpha:1];
}

+(instancetype)second
{
    return [UIColor colorWithRed:0.64705 green:0.73333 blue:0.8549 alpha:1];
}

+(instancetype)background
{
    return [UIColor colorWithRed:0.94901 green:0.94509 blue:0.94901 alpha:1];
}

+(instancetype)lighttext
{
    return [UIColor colorWithRed:0.70901 green:0.70509 blue:0.70901 alpha:1];
}

@end