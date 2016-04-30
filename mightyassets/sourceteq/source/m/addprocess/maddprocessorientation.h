#import <UIKit/UIKit.h>
#import "maddprocessasset.h"

@interface maddprocessorientation:NSObject

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong;

@property(assign, nonatomic)NSInteger width;
@property(assign, nonatomic)NSInteger height;

@end