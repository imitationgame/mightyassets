#import <UIKit/UIKit.h>
#import "caddcoloradd.h"
#import "maddcoloradd.h"
#import "vaddcoloraddheader.h"

@interface vaddcoloradd:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(caddcoloradd*)controller;

@property(strong, nonatomic)maddcoloradd *model;
@property(weak, nonatomic)caddcoloradd *controller;
@property(weak, nonatomic)vaddcoloraddheader *header;
@property(weak, nonatomic)UICollectionView *collection;

@end