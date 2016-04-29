#import <UIKit/UIKit.h>
#import "mprojectitempics.h"

@class cproject;

@interface vproject:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cproject*)controller;
-(void)loadpics;
-(void)clean;

@property(strong, nonatomic)mprojectitempics *pics;
@property(weak, nonatomic)cproject *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end