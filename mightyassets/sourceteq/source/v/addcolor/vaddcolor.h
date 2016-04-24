#import <UIKit/UIKit.h>
#import "caddcolor.h"
#import "vaddcolorbar.h"
#import "maddcolor.h"

@interface vaddcolor:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(caddcolor*)controller;
-(void)viewappear;

@property(strong, nonatomic)maddcolor *model;
@property(weak, nonatomic)caddcolor *controller;
@property(weak, nonatomic)vaddcolorbar *bar;
@property(weak, nonatomic)UICollectionView *collection;

@end