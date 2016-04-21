#import <UIKit/UIKit.h>
#import "clanding.h"
#import "minteractiveconstraints.h"

@interface vlandingbar:UIView

-(instancetype)init:(clanding*)controller;

@property(strong, nonatomic)minteractiveconstraints *
@property(weak, nonatomic)clanding *controller;
@property(weak, nonatomic)UIButton *buttonadd;

@end