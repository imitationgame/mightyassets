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
    CGFloat circleleft = (width - circlesize) / 2.0;
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:17], NSForegroundColorAttributeName:[UIColor main]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.6 alpha:1]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_title", nil) attributes:dicttitle];
    NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_descr", nil) attributes:dictdescr];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrdescr];
    
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
    
    UIView *circle = [[UIView alloc] init];
    [circle setBackgroundColor:[UIColor second]];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:circlesize / 2.0];
    self.circle = circle;
    
    [circle addSubview:iconadd];
    [self addSubview:label];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"label":label, @"iconadd":iconadd, @"circle":circle};
    NSDictionary *metrics = @{@"circlesize":@(circlesize), @"circleleft":@(circleleft)};
    
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(circleleft)-[circle(circlesize)]" options:0 metrics:metrics views:views];
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[circle(circlesize)]-0-[label]-0-|" options:0 metrics:metrics views:views];
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[iconadd]-0-|" options:0 metrics:metrics views:views];
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[iconadd]-0-|" options:0 metrics:metrics views:views];
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views];
    
    return self;
}

@end