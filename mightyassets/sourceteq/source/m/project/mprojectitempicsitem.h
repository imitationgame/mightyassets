#import <UIKit/UIKit.h>

@interface mprojectitempicsitem:NSObject

-(instancetype)init:(NSURL*)url;

@property(strong, nonatomic)NSURL *url;
@property(strong, nonatomic)UIImage *image;
@property(copy, nonatomic)NSString *imagename;
@property(assign, nonatomic)NSInteger imagewidth;
@property(assign, nonatomic)NSInteger imageheight;

@end