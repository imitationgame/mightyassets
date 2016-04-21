#import <UIKit/UIKit.h>

@interface msettings:NSObject

+(instancetype)singleton;
-(void)load;
-(void)save;

@property(assign, nonatomic)BOOL notifications;

@end