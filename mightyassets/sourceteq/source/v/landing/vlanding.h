#import <UIKit/UIKit.h>
#import "clanding.h"
#import "vlandingbar.h"
#import "mproject.h"

@interface vlanding:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(clanding*)controller;

@property(weak, nonatomic)vlandingbar *bar;
@property(weak, nonatomic)clanding *controller;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;
@property(strong, nonatomic)mproject *model;

@end