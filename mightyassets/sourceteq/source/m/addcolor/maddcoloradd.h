#import <Foundation/Foundation.h>
#import "maddcoloradditem.h"

@interface maddcoloradd:NSObject

@property(strong, nonatomic)NSArray<maddcoloradditem*> *items;
@property(weak, nonatomic)maddcoloradditem *red;
@property(weak, nonatomic)maddcoloradditem *green;
@property(weak, nonatomic)maddcoloradditem *blue;

@end