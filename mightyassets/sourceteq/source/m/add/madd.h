#import <UIKit/UIKit.h>
#import "maddsection.h"

@interface madd:NSObject

-(void)registercells:(UICollectionView*)collection;

@property(strong, nonatomic)NSArray<maddsection*> *sections;

@end