#import <UIKit/UIKit.h>
#import "maddprocessorientation.h"
#import "madditempositionitem.h"

@interface maddprocessdevice:NSObject

-(instancetype)init:(maddprocessorientation*)orientation position:(madditempositionitem*)position;
-(instancetype)init:(madditempositionitem*)position;

@property(strong, nonatomic)maddprocessorientation *orientation;
@property(strong, nonatomic)madditempositionitem *position;

@end