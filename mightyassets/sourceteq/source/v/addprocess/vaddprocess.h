#import <UIKit/UIKit.h>
#import "caddprocess.h"
#import "vspinner.h"

@interface vaddprocess:UIView

-(instancetype)init:(caddprocess*)controller;

@property(weak, nonatomic)caddprocess *controller;
@property(weak, nonatomic)vspinner *spinner;

@end