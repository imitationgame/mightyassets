#import <UIKit/UIKit.h>
#import "mprojectitempicsitem.h"

@class mprojectitem;

@interface mprojectitempics:NSObject

-(instancetype)init:(mprojectitem*)model;

@property(weak, nonatomic)mprojectitem *model;
@property(strong, nonatomic)NSMutableArray<mprojectitempicsitem*> *items;

@end