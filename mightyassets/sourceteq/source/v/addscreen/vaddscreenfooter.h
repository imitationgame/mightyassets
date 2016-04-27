#import <UIKit/UIKit.h>
#import "madditemscreensedit.h"

@interface vaddscreenfooter:UICollectionReusableView<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

-(void)config:(madditemscreensedit*)model;

@property(weak, nonatomic)madditemscreensedit *model;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *circle;
@property(weak, nonatomic)UIPopoverController *popover;

@end