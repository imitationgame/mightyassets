#import <UIKit/UIKit.h>
#import "caddscreen.h"

@interface vaddscreen:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(caddscreen*)controller;

@property(weak, nonatomic)caddscreen *controller;

@end