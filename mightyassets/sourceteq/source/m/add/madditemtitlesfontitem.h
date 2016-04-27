#import <UIKit/UIKit.h>

@interface madditemtitlesfontitem:NSObject

-(instancetype)init:(NSString*)name font:(NSString*)font;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *font;

@end