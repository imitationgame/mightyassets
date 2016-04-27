#import "vaddcelltitlesfont.h"
#import "madditemtitlesfont.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static NSInteger const fontsize = 19;

@interface vaddcelltitlesfont ()

@property(weak, nonatomic)madditemtitlesfont *model;

@end

@implementation vaddcelltitlesfont

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *labelfont = [[UILabel alloc] init];
    [labelfont setBackgroundColor:[UIColor clearColor]];
    [labelfont setUserInteractionEnabled:NO];
    [labelfont setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelfont setTextAlignment:NSTextAlignmentRight];
    [labelfont setTextColor:[UIColor main]];
    self.labelfont = labelfont;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont regularsize:16]];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    [label setText:NSLocalizedString(@"madd_item_titlesfont_title", nil)];
    
    [self addSubview:label];
    [self addSubview:labelfont];
    
    NSDictionary *views = @{@"label":label, @"font":labelfont};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[font]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[font]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemtitlesfont*)model
{
    if(model.font)
    {
        [self.labelfont setText:model.font.name];
        [self.labelfont setFont:[UIFont fontWithName:model.font.font size:fontsize]];
    }
    else
    {
        [self.labelfont setText:NSLocalizedString(@"madd_item_titlesfont_default", nil)];
        [self.labelfont setFont:[UIFont regularsize:fontsize]];
    }
    
    [super config:model];
}

@end