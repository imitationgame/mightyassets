#import "madditemtitlesfontitem.h"

@implementation madditemtitlesfontitem

-(instancetype)init:(NSString*)name font:(NSString*)font
{
    self = [super init];
    self.name = name;
    self.font = font;
    
    return self;
}

@end