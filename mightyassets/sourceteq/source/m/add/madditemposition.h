#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditempositionitem.h"

@interface madditemposition:madditem

-(madditempositionitem*)itemselected;

@property(strong, nonatomic)NSArray<madditempositionitem*> *items;
@property(assign, nonatomic)NSInteger selected;

@end