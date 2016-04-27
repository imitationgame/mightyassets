#import <UIKit/UIKit.h>
#import "vadd.h"

@interface vaddbar:UIView

-(instancetype)init:(vadd*)view;

@property(weak, nonatomic)vadd *view;

@end