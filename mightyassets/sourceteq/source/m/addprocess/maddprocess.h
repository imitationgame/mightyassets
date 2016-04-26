#import <UIKit/UIKit.h>
#import "madd.h"

@interface maddprocess:NSObject

-(instancetype)init:(madd*)model;

@property(weak, nonatomic)madd *model;

@end