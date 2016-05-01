#import <UIKit/UIKit.h>
#import "madditemcolors.h"

@interface caddcoloradd:UIViewController

-(instancetype)init:(madditemcolors*)model;
-(void)back;
-(void)changecolor:(UIColor*)color;

@property(weak, nonatomic)madditemcolors *model;

@end