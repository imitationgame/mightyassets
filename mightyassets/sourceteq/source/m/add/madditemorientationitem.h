#import <Foundation/Foundation.h>
#import "madditemposition.h"

@interface madditemorientationitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;
-(madditemposition*)position;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end