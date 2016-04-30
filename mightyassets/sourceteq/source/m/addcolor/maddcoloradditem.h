#import <Foundation/Foundation.h>

@interface maddcoloradditem:NSObject

-(instancetype)init:(NSString*)name;

@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)NSInteger value;

@end