#import <UIKit/UIKit.h>
#import "madditemtitlesfont.h"

@interface caddfont:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(madditemtitlesfont*)model;
-(void)back;

@property(weak, nonatomic)madditemtitlesfont *model;
@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end