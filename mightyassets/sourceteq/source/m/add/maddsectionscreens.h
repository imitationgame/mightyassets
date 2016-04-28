#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "maddsectionproject.h"

@interface maddsectionscreens:maddsection

-(instancetype)init:(maddsectionproject*)modelproject;
-(BOOL)completed;
-(void)clean;

@property(strong, nonatomic)NSMutableArray<madditem*> *items;
@property(weak, nonatomic)maddsectionproject *modelproject;

@end