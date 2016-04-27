#import <UIKit/UIKit.h>

@interface maddprocessdrawabletext:NSObject

-(instancetype)init:(CGFloat)x y :(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@property(strong, nonatomic)NSDictionary *attributes;
@property(copy, nonatomic)NSString *string;
@property(assign, nonatomic)CGRect rect;

@end