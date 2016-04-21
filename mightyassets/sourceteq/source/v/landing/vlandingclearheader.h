#import <UIKit/UIKit.h>
#import "mfixedconstraints.h"

@interface vlandingclearheader:UICollectionReusableView

-(void)config:(mfixedconstraints*)interactive;

@property(weak, nonatomic)NSLayoutConstraint *layoutbottominteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutrightinteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutleftinteractive;
@property(weak, nonatomic)NSLayoutConstraint *layoutheightinteractive;

@end