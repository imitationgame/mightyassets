#import <UIKit/UIKit.h>
#import "vaddcell.h"

@interface vaddcellframe:vaddcell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end