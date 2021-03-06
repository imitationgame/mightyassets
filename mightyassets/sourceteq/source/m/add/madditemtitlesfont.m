#import "madditemtitlesfont.h"
#import "vaddcelltitlesfont.h"
#import "caddfont.h"
#import "cmain.h"

static NSInteger const cellheight = 64;

@implementation madditemtitlesfont

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_titlesfont_title", nil) cellclass:[vaddcelltitlesfont class]];
    self.height = cellheight;
    self.selectable = YES;
    
    [self loadfonts];
    
    return self;
}

#pragma mark functionality

-(void)loadfonts
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSMutableArray<madditemtitlesfontitem*> *array = [NSMutableArray array];
                       NSArray<NSDictionary*> *rawfonts = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"fonts" withExtension:@"plist"]];
                       NSUInteger count = rawfonts.count;
                       
                       for(NSUInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawfont = rawfonts[i];
                           NSString *rawname = rawfont[@"name"];
                           NSString *rawfontname = rawfont[@"font"];
                           madditemtitlesfontitem *item = [[madditemtitlesfontitem alloc] init:rawname font:rawfontname];
                           
                           [array addObject:item];
                       }
                       
                       welf.items = [array sortedArrayUsingComparator:
                        ^NSComparisonResult(madditemtitlesfontitem *obj1, madditemtitlesfontitem *obj2)
                       {
                           return [obj1.name compare:obj2.name];
                       }];
                   });
}

#pragma mark -
#pragma mark add item

-(void)selectedaction
{
    caddfont *controller = [[caddfont alloc] init:self];
    [[cmain singleton] pushViewController:controller animated:YES];
}

@end