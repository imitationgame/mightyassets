#import <Foundation/Foundation.h>
#import "maddprocessdevice.h"

@interface madditemprojectdevicesitem:NSObject

-(instancetype)init:(NSString*)name;
-(NSArray<maddprocessdevice*>*)devices:(madditempositionitem*)position;

@property(copy, nonatomic)NSString *name;

@end