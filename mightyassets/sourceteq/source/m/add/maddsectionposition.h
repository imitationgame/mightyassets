#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "madditemframe.h"
#import "madditemorientation.h"
#import "madditemposition.h"

@interface maddsectionposition:maddsection

-(void)changeposition:(madditemposition*)modelposition;

@property(strong, nonatomic)NSMutableArray<madditem*> *items;
@property(weak, nonatomic)madditemframe *modelframe;
@property(weak, nonatomic)madditemorientation *modelorientation;
@property(weak, nonatomic)madditemposition *modelposition;

@end