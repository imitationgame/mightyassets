#import <UIKit/UIKit.h>
#import "mprojectitempicsitem.h"

@interface vprojectcell:UICollectionViewCell

-(void)config:(mprojectitempicsitem*)model textheight:(NSInteger)textheight;

@property(strong, nonatomic)NSDictionary *attrname;
@property(strong, nonatomic)NSDictionary *attrdescr;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabelheight;
@property(weak, nonatomic)UILabel *label;

@end