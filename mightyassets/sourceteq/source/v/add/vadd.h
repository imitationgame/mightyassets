#import <UIKit/UIKit.h>
#import "cadd.h"
#import "madd.h"

@interface vadd:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cadd*)controller;

@property(strong, nonatomic)madd *model;
@property(weak, nonatomic)cadd *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;
@property(weak, nonatomic)UICollectionView *collection;

@end