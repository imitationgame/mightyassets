#import <Foundation/Foundation.h>
#import "maddprocessasset.h"

@interface madditemframeitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;
-(maddprocessasset*)asset;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end