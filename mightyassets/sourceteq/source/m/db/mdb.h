#import <UIKit/UIKit.h>

@class mdbitem;
@class mcourseitemchapter;

@interface mdb:NSObject

+(void)updatedb:(NSString*)documents;
+(NSArray<NSDictionary*>*)fetchprojects;
+(NSInteger)addproject:(NSString*)name created:(NSInteger)created;
+(void)deleteproject:(NSInteger)projectid;

@end