#import <UIKit/UIKit.h>
#import "caddcolor.h"

@interface vaddcolorbar:UIView

-(instancetype)init:(caddcolor*)controller;

@property(weak, nonatomic)caddcolor *controller;

@end