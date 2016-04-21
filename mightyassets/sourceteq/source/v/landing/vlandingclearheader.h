#import <UIKit/UIKit.h>
#import "mfixedconstraints.h"
#import "clanding.h"

@interface vlandingclearheader:UICollectionReusableView

-(void)config:(clanding*)controller constraints:(mfixedconstraints*)interactive;

@property(weak, nonatomic)clanding *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutbottominteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutrightinteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutleftinteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutheightinteractive;

@end