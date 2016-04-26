#import <UIKit/UIKit.h>
#import "maddprocessorientation.h"

@interface maddprocessdevice:NSObject

@property(strong, nonatomic)maddprocessorientation *orientation;
@property(assign, nonatomic)NSInteger width;
@property(assign, nonatomic)NSInteger height;

@end