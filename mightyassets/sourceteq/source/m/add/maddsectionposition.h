#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "madditemframe.h"
#import "madditemorientation.h"
#import "madditemposition.h"

@interface maddsectionposition:maddsection

@property(weak, nonatomic)madditemframe *modelframe;
@property(weak, nonatomic)madditemorientation *modelorientation;
@property(weak, nonatomic)madditemposition *modelposition;

@end