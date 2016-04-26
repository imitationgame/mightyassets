#import <UIKit/UIKit.h>
#import "madditemscreensedittitle.h"

@interface vaddscreencell:UICollectionViewCell<UITextFieldDelegate>

-(void)config:(NSInteger)index model:(madditemscreensedittitle*)model;

@property(weak, nonatomic)madditemscreensedittitle *model;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UILabel *labelindex;

@end