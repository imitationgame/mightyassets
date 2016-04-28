#import <UIKit/UIKit.h>
#import "cproject.h"

@interface vprojectbar:UIView

-(instancetype)init:(cproject*)controller;

@property(weak, nonatomic)cproject *controller;

@end