#import <UIKit/UIKit.h>
#import "clanding.h"

@interface vlanding:UIView

-(instancetype)init:(clanding*)controller;

@property(weak, nonatomic)UIViewController *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end