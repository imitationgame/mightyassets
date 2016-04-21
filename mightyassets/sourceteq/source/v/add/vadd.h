#import <UIKit/UIKit.h>
#import "cadd.h"

@interface vadd:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cadd*)controller;

@property(weak, nonatomic)cadd *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end