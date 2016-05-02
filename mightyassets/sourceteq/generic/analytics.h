#import <UIKit/UIKit.h>
#import <Google/Analytics.h>

@interface analytics:NSObject

+(instancetype)singleton;
-(void)start;
-(void)trackscreen:(UIViewController*)controller;
-(void)trackevent:(NSString*)event action:(NSString*)action label:(NSString*)label;

@property(weak, nonatomic)id<GAITracker> tracker;

@end