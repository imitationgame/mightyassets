#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "maddsectionproject.h"

@interface maddsectionscreens:maddsection

-(instancetype)init:(maddsectionproject*)modelproject;

@property(weak, nonatomic)maddsectionproject *modelproject;

@end