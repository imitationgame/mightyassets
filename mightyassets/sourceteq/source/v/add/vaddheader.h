#import <UIKit/UIKit.h>
#import "maddsection.h"

@interface vaddheader:UICollectionReusableView

-(void)config:(maddsection*)model;

@property(weak, nonatomic)UILabel *name;

@end