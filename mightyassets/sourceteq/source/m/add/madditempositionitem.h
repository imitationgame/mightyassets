#import <Foundation/Foundation.h>
#import "maddprocessorientation.h"

@interface madditempositionitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;
-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end