#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemorientationitem.h"

@class maddsectionposition;

@interface madditemorientation:madditem

-(instancetype)init:(maddsectionposition*)position;
-(madditemorientationitem*)itemselected;
-(void)changeselected:(NSInteger)selected;

@property(weak, nonatomic)maddsectionposition *position;
@property(strong, nonatomic)NSArray<madditemorientationitem*> *items;
@property(assign, nonatomic)NSInteger selected;

@end