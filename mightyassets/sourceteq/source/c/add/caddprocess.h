#import <UIKit/UIKit.h>
#import "madd.h"

@interface caddprocess:UIViewController

-(instancetype)init:(madd*)model;

@property(strong, nonatomic)madd *model;

@end