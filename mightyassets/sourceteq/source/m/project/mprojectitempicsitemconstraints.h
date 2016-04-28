#import <UIKit/UIKit.h>

@interface mprojectitempicsitemconstraints:NSObject

+(instancetype)imagewidth:(NSInteger)imagewidth imageheight:(NSInteger)imageheight maxwidth:(NSInteger)maxwidth maxheight:(NSInteger)maxheight textheight:(NSInteger)textheight;

@property(assign, nonatomic)NSInteger cellwidth;
@property(assign, nonatomic)NSInteger cellheight;
@property(assign, nonatomic)NSInteger insetstop;

@end