#import "vaddcoloraddcell.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static NSInteger const colormin = 0;
static NSInteger const colormax = 255;

@implementation vaddcoloraddcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setClipsToBounds:YES];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setClipsToBounds:YES];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setBackgroundColor:[UIColor background]];
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setMinimumValue:colormin];
    [slider setMaximumValue:colormax];
    [slider setContinuous:YES];
    [slider setMinimumTrackTintColor:[UIColor main]];
    [slider setMaximumTrackTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    self.slider = slider;
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:12]];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    self.label = label;
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:label];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"borderbottom":borderbottom, @"slider":slider, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[borderbottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label(50)]-0-[slider]-150-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[slider]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    NSInteger value = roundf(slider.value);
    self.model.value = value;
    [self.view.header refresh];
}

#pragma mark public

-(void)config:(maddcoloradditem*)model view:(vaddcoloradd*)view;
{
    self.model = model;
    self.view = view;
    [self.label setText:model.name];
    [self.slider setValue:model.value animated:NO];
}

@end