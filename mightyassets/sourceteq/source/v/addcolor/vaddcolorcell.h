#import <UIKit/UIKit.h>
#import "maddcoloritem.h"

@interface vaddcolorcell:UICollectionViewCell

-(void)config:(maddcoloritem*)model;

@property(weak, nonatomic)UIImageView *circle;

@end