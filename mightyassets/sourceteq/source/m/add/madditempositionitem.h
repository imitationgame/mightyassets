#import <Foundation/Foundation.h>

@interface madditempositionitem:NSObject

-(instancetype)init:(NSString*)name asset:(NSString*)asset;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *asset;

@end