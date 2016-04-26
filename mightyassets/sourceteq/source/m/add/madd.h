#import <UIKit/UIKit.h>
#import "maddsection.h"
#import "maddprocessasset.h"

@interface madd:NSObject

-(void)registercells:(UICollectionView*)collection;

@property(strong, nonatomic)NSArray<maddsection*> *sections;
@property(strong, nonatomic)maddprocessasset *asset;
@property(weak, nonatomic)maddsection *modelproject;
@property(weak, nonatomic)maddsection *modelcolors;
@property(weak, nonatomic)maddsection *modelposition;
@property(weak, nonatomic)maddsection *modelscreens;

@end