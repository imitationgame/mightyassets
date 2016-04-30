#import <UIKit/UIKit.h>
#import "madditem.h"

@interface vaddcell:UICollectionViewCell

-(void)config:(madditem*)model topcollection:(UICollectionView*)topcollection;
-(void)hover;

@property(weak, nonatomic)madditem *model;
@property(weak, nonatomic)UICollectionView *topcollection;

@end