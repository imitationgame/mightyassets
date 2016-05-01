#import <UIKit/UIKit.h>
#import "maddcoloradd.h"

@interface vaddcoloraddheader:UICollectionReusableView

-(void)config:(maddcoloradd*)model;
-(void)refresh;

@property(weak, nonatomic)maddcoloradd *model;
@property(weak, nonatomic)UIImageView *circle;

@end