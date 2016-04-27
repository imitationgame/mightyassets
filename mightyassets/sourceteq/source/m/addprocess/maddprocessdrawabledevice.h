#import <UIKit/UIKit.h>

@interface maddprocessdrawabledevice:NSObject

-(instancetype)init:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@property(strong, nonatomic)UIImage *image;
@property(assign, nonatomic)CGRect rect;

@end