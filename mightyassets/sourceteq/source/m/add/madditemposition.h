#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditempositionitem.h"

@interface madditemposition:madditem

@property(strong, nonatomic)NSArray<madditempositionitem*> *items;

@end