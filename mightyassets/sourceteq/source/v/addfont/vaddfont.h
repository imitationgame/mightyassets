#import <UIKit/UIKit.h>
#import "caddfont.h"

@interface vaddfont:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(caddfont*)controller;

@property(weak, nonatomic)caddfont *controller;

@end