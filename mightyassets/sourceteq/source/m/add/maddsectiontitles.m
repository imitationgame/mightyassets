#import "maddsectiontitles.h"

@implementation maddsectiontitles

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_titles_name", nil)];
    
    madditemtitlesfont *modelfont = [[madditemtitlesfont alloc] init];
    self.modelfont = modelfont;
    
    self.items = @[
                   modelfont
                   ];
    
    return self;
}

@end