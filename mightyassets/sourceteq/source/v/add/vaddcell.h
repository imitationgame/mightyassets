#import <UIKit/UIKit.h>
#import "madditem.h"

@interface vaddcell:UICollectionViewCell

-(void)config:(madditem*)model;

@property(weak, nonatomic)madditem *model;

@end