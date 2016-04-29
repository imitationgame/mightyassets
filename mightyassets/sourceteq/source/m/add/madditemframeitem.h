#import <Foundation/Foundation.h>

@interface madditemframeitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end