#import <UIKit/UIKit.h>
#import "caddcoloradd.h"

@interface vaddcoloradd:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(caddcoloradd*)controller;

@property(weak, nonatomic)caddcoloradd *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end