#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemframeitem.h"

@interface madditemframe:madditem

-(madditemframeitem*)itemselected;

@property(strong, nonatomic)NSArray<madditemframeitem*> *items;
@property(assign, nonatomic)NSInteger selected;

@end