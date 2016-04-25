#import <Foundation/Foundation.h>
#import "madditem.h"
#import "maddsectionscreens.h"

@interface madditemscreensadd:madditem

-(instancetype)init:(maddsectionscreens*)model;

@property(weak, nonatomic)maddsectionscreens *model;

@end