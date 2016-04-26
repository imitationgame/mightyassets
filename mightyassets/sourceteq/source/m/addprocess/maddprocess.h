#import <UIKit/UIKit.h>
#import "madd.h"

@interface maddprocess:NSObject

-(instancetype)init:(madd*)model;

@property(weak, nonatomic)madd *model;
@property(strong, nonatomic)UIColor *colorbackground;
@property(strong, nonatomic)UIColor *colordevice;
@property(strong, nonatomic)UIColor *colortext;

@end