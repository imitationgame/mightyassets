#import <UIKit/UIKit.h>

@interface maddprocessdrawablescreen:NSObject

-(instancetype)init:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@property(weak, nonatomic)UIImage *image;
@property(assign, nonatomic)CGRect rect;

@end