#import <UIKit/UIKit.h>
#import "madditemorientationitem.h"

@interface vaddcellorientationcell:UICollectionViewCell

-(void)config:(madditemorientationitem*)model;

@property(weak, nonatomic)UIImageView *asset;
@property(weak, nonatomic)UILabel *name;

@end