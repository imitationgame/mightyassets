#import <Foundation/Foundation.h>
#import "mprojectitem.h"

@interface mproject:NSObject

+(mprojectitem*)newproject:(NSString*)name;

@property(strong, nonatomic)NSMutableArray<mprojectitem*> *items;

@end