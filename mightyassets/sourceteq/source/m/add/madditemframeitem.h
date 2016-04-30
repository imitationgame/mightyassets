#import <Foundation/Foundation.h>
#import "maddprocessasset.h"

@interface madditemframeitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;
-(maddprocessasset*)modelasset;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end