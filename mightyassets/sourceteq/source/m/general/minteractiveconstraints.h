#import <Foundation/Foundation.h>

@interface minteractiveconstraints:NSObject

-(instancetype)init:(NSInteger)top right:(NSInteger)right bottom:(NSInteger)bottom left:(NSInteger)left;

@property(copy, nonatomic)NSNumber *top;
@property(copy, nonatomic)NSNumber *right;
@property(copy, nonatomic)NSNumber *bottom;
@property(copy, nonatomic)NSNumber *left;

@end