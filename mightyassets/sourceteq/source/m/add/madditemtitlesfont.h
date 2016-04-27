#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemtitlesfontitem.h"

@interface madditemtitlesfont:madditem

@property(strong, nonatomic)NSMutableArray<madditemtitlesfont*> *items;
@property(copy, nonatomic)NSString *fontname;

@end