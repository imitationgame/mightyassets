#import <UIKit/UIKit.h>
#import "madditemscreensedittitle.h"

@interface vaddscreencell:UICollectionViewCell<UITextFieldDelegate>

-(void)config:(madditemscreensedittitle*)model;

@property(weak, nonatomic)madditemscreensedittitle *model;
@property(weak, nonatomic)UITextField *field;

@end