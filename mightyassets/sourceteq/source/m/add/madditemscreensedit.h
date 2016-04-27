#import <UIKit/UIKit.h>
#import "madditem.h"
#import "maddsectionscreens.h"
#import "madditemscreensedittitle.h"

@interface madditemscreensedit:madditem

-(instancetype)init:(NSInteger)index model:(maddsectionscreens*)model;
-(NSInteger)titlescompleted;

@property(weak, nonatomic)maddsectionscreens *model;
@property(assign, nonatomic)NSInteger index;
@property(strong, nonatomic)UIImage *image;
@property(strong, nonatomic)NSMutableArray<madditemscreensedittitle*> *titles;

@end