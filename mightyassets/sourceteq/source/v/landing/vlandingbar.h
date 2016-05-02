#import <UIKit/UIKit.h>
#import "clanding.h"
#import "mfixedconstraints.h"

@interface vlandingbar:UIView

-(instancetype)init:(clanding*)controller;

@property(strong, nonatomic)mfixedconstraints *interactiveconstraints;
@property(weak, nonatomic)clanding *controller;
@property(weak, nonatomic)UIButton *buttonadd;
@property(weak, nonatomic)NSLayoutConstraint *layoutlogotop;

@end