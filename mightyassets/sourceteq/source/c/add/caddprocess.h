#import <UIKit/UIKit.h>
#import "madd.h"
#import "maddprocess.h"

@interface caddprocess:UIViewController

-(instancetype)init:(madd*)model;

@property(strong, nonatomic)madd *model;
@property(strong, nonatomic)maddprocess *process;

@end