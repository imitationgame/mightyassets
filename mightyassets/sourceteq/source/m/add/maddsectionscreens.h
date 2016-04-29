#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "maddsectionproject.h"

@class madditemscreensedit;

@interface maddsectionscreens:maddsection

-(instancetype)init:(maddsectionproject*)modelproject;
-(BOOL)completed;
-(void)clean;
-(NSArray<madditemscreensedit*>*)screens;
-(void)remove:(madditemscreensedit*)screen;

@property(strong, nonatomic)NSMutableArray<madditem*> *items;
@property(weak, nonatomic)maddsectionproject *modelproject;

@end