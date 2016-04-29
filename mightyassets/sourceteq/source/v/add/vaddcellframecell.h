#import <UIKit/UIKit.h>
#import "madditemframeitem.h"

@interface vaddcellframecell:UICollectionViewCell

-(void)config:(madditemframeitem*)model;

@property(weak, nonatomic)UIImageView *asset;
@property(weak, nonatomic)UILabel *name;

@end