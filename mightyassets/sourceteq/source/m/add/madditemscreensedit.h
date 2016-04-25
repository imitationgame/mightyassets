#import <UIKit/UIKit.h>
#import "madditem.h"
#import "maddsectionscreens.h"

@interface madditemscreensedit:madditem

-(instancetype)init:(NSInteger)index model:(maddsectionscreens*)model;

@property(weak, nonatomic)maddsectionscreens *model;
@property(assign, nonatomic)NSInteger index;
@property(strong, nonatomic)UIImageView *image;
@property(strong, nonatomic)NSMutableArray<NSString*> *titles;

@end