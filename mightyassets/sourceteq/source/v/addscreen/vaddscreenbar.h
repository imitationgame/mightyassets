#import <UIKit/UIKit.h>
#import "caddscreen.h"

@interface vaddscreenbar:UIView

-(instancetype)init:(caddscreen*)controller;

@property(weak, nonatomic)caddscreen *controller;

@end