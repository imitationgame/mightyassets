#import <UIKit/UIKit.h>
#import "cadd.h"

@interface vaddbar:UIView

-(instancetype)init:(cadd*)controller;

@property(weak, nonatomic)cadd *controller;

@end