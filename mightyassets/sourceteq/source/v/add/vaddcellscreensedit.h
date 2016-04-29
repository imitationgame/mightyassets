#import <UIKit/UIKit.h>
#import "vaddcell.h"

@interface vaddcellscreensedit:vaddcell

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *icondonetitles;
@property(weak, nonatomic)UIImageView *icondoneimage;
@property(weak, nonatomic)UIImageView *iconwarning;
@property(weak, nonatomic)UIButton *buttonremove;
@property(weak, nonatomic)NSLayoutConstraint *layouticontitleswidth;
@property(weak, nonatomic)NSLayoutConstraint *layouticonimagewidth;
@property(weak, nonatomic)NSLayoutConstraint *layouticonwarningwidth;

@end