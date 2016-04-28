#import <UIKit/UIKit.h>
#import "mprojectitem.h"

@interface vlandingcell:UICollectionViewCell

-(void)config:(mprojectitem*)model;

@property(weak, nonatomic)UILabel *label;
@property(strong, nonatomic)NSDictionary *attributesname;
@property(strong, nonatomic)NSDictionary *attributescreated;

@end