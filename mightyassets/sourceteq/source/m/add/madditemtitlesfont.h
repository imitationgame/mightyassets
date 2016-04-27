#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemtitlesfontitem.h"

@interface madditemtitlesfont:madditem

@property(strong, nonatomic)NSArray<madditemtitlesfontitem*> *items;
@property(weak, nonatomic)madditemtitlesfontitem *font;

@end