#import <UIKit/UIKit.h>
#import "vadd.h"
#import "vblur.h"

@interface vaddwarning:UIView

-(instancetype)init:(vadd*)view;

@property(weak, nonatomic)vadd *view;

@end