#import <UIKit/UIKit.h>
#import "madditempositionitem.h"

@interface vaddcellpositioncell:UICollectionViewCell

-(void)config:(madditempositionitem*)model;

@property(weak, nonatomic)UIImageView *asset;
@property(weak, nonatomic)UILabel *name;

@end