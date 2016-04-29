#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemorientationitem.h"

@interface madditemorientation:madditem

-(madditemorientationitem*)itemselected;

@property(strong, nonatomic)NSArray<madditemorientationitem*> *items;
@property(assign, nonatomic)NSInteger selected;

@end