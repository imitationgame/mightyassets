#import <UIKit/UIKit.h>
#import "cproject.h"

@interface vproject:UIView

-(instancetype)init:(cproject*)controller;

@property(weak, nonatomic)cproject *controller;

@end