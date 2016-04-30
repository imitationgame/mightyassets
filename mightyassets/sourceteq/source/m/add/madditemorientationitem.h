#import <Foundation/Foundation.h>
#import "madditemposition.h"

@class madditemorientation;

@interface madditemorientationitem:NSObject

-(instancetype)init:(madditemorientation*)orientation;
-(instancetype)init:(madditemorientation*)orientation name:(NSString*)name asset:(NSString*)asset;
-(madditemposition*)position;

@property(weak, nonatomic)madditemorientation *orientation;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end