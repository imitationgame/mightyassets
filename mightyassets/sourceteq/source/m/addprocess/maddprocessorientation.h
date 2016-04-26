#import <UIKit/UIKit.h>

@interface maddprocessorientation:NSObject

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong;

@property(assign, nonatomic)CGFloat rotation;
@property(assign, nonatomic)NSInteger width;
@property(assign, nonatomic)NSInteger height;

@end