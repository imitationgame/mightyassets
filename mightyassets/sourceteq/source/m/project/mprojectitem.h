#import <Foundation/Foundation.h>

@interface mprojectitem:NSObject

-(instancetype)init:(NSInteger)itemid created:(NSInteger)created name:(NSString*)name;

@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)NSInteger itemid;
@property(assign, nonatomic)NSInteger created;

@end