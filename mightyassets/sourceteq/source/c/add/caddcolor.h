#import <UIKit/UIKit.h>
#import "madditemcolors.h"

@interface caddcolor:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(madditemcolors*)model;
-(void)back;
-(void)changecolor:(UIColor*)color;

@property(weak, nonatomic)madditemcolors *model;
@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end