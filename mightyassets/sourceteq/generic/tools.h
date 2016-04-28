#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(void)shareapp;
+(NSDictionary*)defaultdict;
+(UIImage*)qrcode:(NSString*)string;
+(NSString*)cleanlatin:(NSString*)string;
+(NSString*)elapsedtimefrom:(NSUInteger)timestamp;
-(NSString*)urlencode:(NSString*)string;

@end