#import <UIKit/UIKit.h>
#import "maddsectionproject.h"
#import "maddsectiontitles.h"
#import "maddsectioncolors.h"
#import "maddsectionposition.h"
#import "maddsectionscreens.h"

@interface madd:NSObject

-(void)registercells:(UICollectionView*)collection;

@property(strong, nonatomic)NSArray<maddsection*> *sections;
@property(weak, nonatomic)maddsectionproject *modelproject;
@property(weak, nonatomic)maddsectiontitles *modeltitles;
@property(weak, nonatomic)maddsectioncolors *modelcolors;
@property(weak, nonatomic)maddsectionposition *modelposition;
@property(weak, nonatomic)maddsectionscreens *modelscreens;

@end