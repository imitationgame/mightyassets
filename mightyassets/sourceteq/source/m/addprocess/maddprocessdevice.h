#import <UIKit/UIKit.h>
#import "maddprocessorientation.h"
#import "madditempositionitem.h"

@interface maddprocessdevice:NSObject

-(instancetype)init:(madditempositionitem*)position sideshort:(NSInteger)sideshort sidelong:(NSInteger)sidelong fontsize:(NSInteger)fontsize;
-(instancetype)init:(madditempositionitem*)position;

@property(strong, nonatomic)maddprocessorientation *orientation;
@property(strong, nonatomic)madditempositionitem *position;
@property(assign, nonatomic)NSInteger fontsize;

@end