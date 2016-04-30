#import <Foundation/Foundation.h>
#import "madditemposition.h"
#import "maddprocessassetoriented.h"

@class madditemorientation;

@interface madditemorientationitem:NSObject

-(instancetype)init:(madditemorientation*)orientation;
-(instancetype)init:(madditemorientation*)orientation name:(NSString*)name asset:(NSString*)asset;
-(madditemposition*)position;
-(maddprocessassetoriented*)assetoriented:(maddprocessasset*)asset;

@property(weak, nonatomic)madditemorientation *orientation;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end