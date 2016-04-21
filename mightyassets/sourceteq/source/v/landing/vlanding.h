#import <UIKit/UIKit.h>
#import "clanding.h"
#import "vlandingbar.h"

@interface vlanding:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(clanding*)controller;

@property(weak, nonatomic)vlandingbar *bar;
@property(weak, nonatomic)UIViewController *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutbartop;

@end