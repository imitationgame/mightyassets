#import <UIKit/UIKit.h>
#import "clanding.h"

@interface vlandingbar:UIView

-(instancetype)init:(clanding*)controller;

@property(weak, nonatomic)clanding *controller;
@property(weak, nonatomic)UIButton *buttonadd;

@end