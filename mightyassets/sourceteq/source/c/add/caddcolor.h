#import <UIKit/UIKit.h>
#import "madditemcolors.h"

@interface caddcolor:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(madditemcolors*)model;

@property(weak, nonatomic)madditemcolors *model;

@end