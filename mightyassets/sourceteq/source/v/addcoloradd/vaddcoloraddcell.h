#import <UIKit/UIKit.h>
#import "maddcoloradditem.h"
#import "vaddcoloradd.h"

@interface vaddcoloraddcell:UICollectionViewCell<UITextFieldDelegate>

-(void)config:(maddcoloradditem*)model view:(vaddcoloradd*)view;

@property(weak, nonatomic)maddcoloradditem *model;
@property(weak, nonatomic)vaddcoloradd *view;
@property(weak, nonatomic)UISlider *slider;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UILabel *label;

@end