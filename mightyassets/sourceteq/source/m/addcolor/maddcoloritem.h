#import <UIKit/UIKit.h>

@interface maddcoloritem:NSObject

-(instancetype)init:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

@property(strong, nonatomic)UIColor *color;
@property(assign, nonatomic)NSInteger red;
@property(assign, nonatomic)NSInteger green;
@property(assign, nonatomic)NSInteger blue;

@end