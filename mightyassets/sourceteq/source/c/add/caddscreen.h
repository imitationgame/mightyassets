#import <UIKit/UIKit.h>
#import "madditemscreensedit.h"

@interface caddscreen:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(madditemscreensedit*)model;
-(void)back;

@property(weak, nonatomic)madditemscreensedit *model;
@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end