#import <UIKit/UIKit.h>
#import "mprojectitempicsitemconstraints.h"

@interface mprojectitempicsitem:NSObject

-(instancetype)init:(NSURL*)url;

@property(strong, nonatomic)mprojectitempicsitemconstraints *constraints;
@property(strong, nonatomic)NSURL *url;
@property(strong, nonatomic)UIImage *image;
@property(copy, nonatomic)NSString *imagename;
@property(assign, nonatomic)NSInteger imagewidth;
@property(assign, nonatomic)NSInteger imageheight;

@end