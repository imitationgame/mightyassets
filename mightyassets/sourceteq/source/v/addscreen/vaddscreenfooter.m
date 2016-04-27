#import "vaddscreenfooter.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static NSInteger const labelleft = 10;
static NSInteger const labelright = 0;
static NSInteger const labeltop = 20;
static NSInteger const circlesize = 70;

@implementation vaddscreenfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat width = frame.size.width;
    CGFloat width_2 = width / 2.0;
    CGFloat labelwidth = width_2 - (labelleft + labelright);
    CGFloat circleleft = ((width_2 - circlesize) / 2.0) + width_2;
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:17], NSForegroundColorAttributeName:[UIColor main]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.6 alpha:1]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_title", nil) attributes:dicttitle];
    NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_descr", nil) attributes:dictdescr];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrdescr];
    
    CGFloat labelheight = ceilf([mut boundingRectWithSize:CGSizeMake(labelwidth, 500) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    
    UIImageView *iconadd = [[UIImageView alloc] init];
    [iconadd setClipsToBounds:YES];
    [iconadd setContentMode:UIViewContentModeCenter];
    [iconadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconadd setUserInteractionEnabled:NO];
    [iconadd setImage:[UIImage imageNamed:@"add_screen"]];
    self.iconadd = iconadd;
    
    UIView *redcircle = [[UIView alloc] init];
    [redcircle setBackgroundColor:[UIColor second]];
    [redcircle setClipsToBounds:YES];
    [redcircle setUserInteractionEnabled:NO];
    [redcircle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [redcircle.layer setCornerRadius:circlesize / 2.0];
    self.redcircle = redcircle;
    
    [self addSubview:label];
    [self addSubview:redcircle];
    [self addSubview:iconadd];
    
    NSDictionary *views = @{@"label":label, @"iconadd":iconadd, @"redcircle":redcircle};
    NSDictionary *metrics = @{@"width_2":@(width_2), @"labelleft":@(labelleft), @"labelwidth":@(labelwidth), @"labelheight":@(labelheight), @"labeltop":@(labeltop), @"circlesize":@(circlesize), @"circleleft":@(circleleft)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(labelleft)-[label(labelwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(labeltop)-[label(labelheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(width_2)-[iconadd]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(circleleft)-[redcircle(circlesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[iconadd(circlesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[redcircle(circlesize)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end