#import <UIKit/UIKit.h>

@interface maddprocessorientation:NSObject

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong;
-(UIImage*)imageoriented:(UIImage*)image;

@property(assign, nonatomic)NSInteger width;
@property(assign, nonatomic)NSInteger height;

@end