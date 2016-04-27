#import <UIKit/UIKit.h>
#import "vadd.h"
#import "vblur.h"

@interface vaddwarning:UIView

-(instancetype)init:(vadd*)view;
-(void)actioncontinue:(UIButton*)button;

@property(weak, nonatomic)vadd *view;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIButton *buttoncancel;
@property(weak, nonatomic)UIButton *buttoncontinue;

@end