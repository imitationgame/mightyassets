#import <Foundation/Foundation.h>
#import "maddprocessorientation.h"
#import "maddprocessasset.h"

@interface madditempositionitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;
-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong;
-(NSInteger)visiblewidthfor:(maddprocessasset*)asset;
-(NSInteger)visibleheightfor:(maddprocessasset*)asset;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;
@property(assign, nonatomic)NSInteger percenttop;
@property(assign, nonatomic)NSInteger percentbottom;

@end