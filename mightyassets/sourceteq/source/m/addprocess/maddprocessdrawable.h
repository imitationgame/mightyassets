#import <UIKit/UIKit.h>
#import "maddprocessdrawabledevice.h"
#import "maddprocessdrawabletext.h"
#import "maddprocessdrawablescreen.h"

@interface maddprocessdrawable:NSObject

-(instancetype)init:(NSInteger)width height:(NSInteger)height;

@property(strong, nonatomic)maddprocessdrawabledevice *device;
@property(strong, nonatomic)maddprocessdrawabletext *text;
@property(strong, nonatomic)maddprocessdrawablescreen *screen;
@property(assign, nonatomic)CGRect rect;

@end