#import <UIKit/UIKit.h>
#import "mprojectitem.h"

@interface cproject:UIViewController

-(instancetype)init:(mprojectitem*)model;

@property(strong, nonatomic)mprojectitem *model;

@end