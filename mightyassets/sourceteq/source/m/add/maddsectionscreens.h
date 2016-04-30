#import <Foundation/Foundation.h>
#import "maddsection.h"

@class madd;
@class madditemscreensedit;

@interface maddsectionscreens:maddsection

-(instancetype)init:(madd*)model;
-(BOOL)completed;
-(void)clean;
-(NSArray<madditemscreensedit*>*)screens;
-(void)remove:(madditemscreensedit*)screen;

@property(strong, nonatomic)NSMutableArray<madditem*> *items;
@property(weak, nonatomic)madd *model;

@end