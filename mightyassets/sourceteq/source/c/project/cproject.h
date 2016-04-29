#import <UIKit/UIKit.h>
#import "mprojectitem.h"
#import "vproject.h"

@interface cproject:UIViewController

-(instancetype)init:(mprojectitem*)model;
-(void)back;
-(void)deleteproject;

@property(strong, nonatomic)mprojectitem *model;
@property(strong, nonatomic)vproject *view;

@end