#import <UIKit/UIKit.h>
#import "vaddcell.h"

@interface vaddcellorientation:vaddcell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end