#import <UIKit/UIKit.h>
#import "vaddcell.h"

@interface vaddcellposition:vaddcell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end