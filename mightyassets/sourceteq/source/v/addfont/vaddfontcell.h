#import <UIKit/UIKit.h>
#import "madditemtitlesfontitem.h"

@interface vaddfontcell:UICollectionViewCell

-(void)config:(madditemtitlesfontitem*)model;

@property(weak, nonatomic)UILabel *label;

@end