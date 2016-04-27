#import "vaddcellscreensadd.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vaddcellscreensadd

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont boldsize:15]];
    [label setTextColor:[UIColor main]];
    [label setText:NSLocalizedString(@"madd_item_screensadd_title", nil)];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setImage:[UIImage imageNamed:@"generic_add"]];
    
    [self addSubview:label];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon]-5-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[icon]-15-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end