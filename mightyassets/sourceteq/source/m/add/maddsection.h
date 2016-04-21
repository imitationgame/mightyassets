#import <Foundation/Foundation.h>
#import "madditem.h"

@interface maddsection:NSObject

-(instancetype)init:(NSString*)name;

@property(strong, nonatomic)NSArray<madditem*> *items;
@property(copy, nonatomic)NSString *name;

@end