#import <UIKit/UIKit.h>
#import "madd.h"

@interface cpages:UIPageViewController

-(void)page_landing:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated;
-(void)page_add;
-(void)page_addprocess:(madd*)model;

@end