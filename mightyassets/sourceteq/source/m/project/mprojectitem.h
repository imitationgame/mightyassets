#import <UIKit/UIKit.h>
#import "mprojectitempics.h"

@interface mprojectitem:NSObject

-(instancetype)init:(NSInteger)itemid created:(NSInteger)created name:(NSString*)name;
-(void)addimage:(UIImage*)image name:(NSString*)name;
-(mprojectitempics*)pics;
-(NSString*)folderpath;
-(void)share;
-(void)remove;

@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)NSInteger itemid;
@property(assign, nonatomic)NSInteger created;

@end