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
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont regularsize:17]];
    [field setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:self];
    self.field = field;
    
    UIView *fieldbase = [[UIView alloc] init];
    [fieldbase setBackgroundColor:[UIColor clearColor]];
    [fieldbase setTranslatesAutoresizingMaskIntoConstraints:NO];
    [fieldbase setClipsToBounds:YES];
    [fieldbase.layer setCornerRadius:4];
    [fieldbase.layer setBorderWidth:1];
    [fieldbase.layer setBorderColor:[UIColor background].CGColor];
    
    [fieldbase addSubview:field];
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:label];
    [self addSubview:fieldbase];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"borderbottom":borderbottom, @"slider":slider, @"label":label, @"fieldbase":fieldbase, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[borderbottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label(50)]-0-[slider]-10-[fieldbase(55)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[slider]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[fieldbase]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionslider:(UISlider*)slider
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    NSInteger value = roundf(slider.value);
    self.model.value = value;
    [self.view.header refresh];
    [self print];
}

#pragma mark functionality

-(void)print
{
    NSString *stringvalue = [NSString stringWithFormat:@"%@", @(self.model.value)];
    [self.field setText:stringvalue];
}

#pragma mark public

-(void)config:(maddcoloradditem*)model view:(vaddcoloradd*)view;
{
    self.model = model;
    self.view = view;
    [self.label setText:model.name];
    [self.slider setValue:model.value animated:NO];
    [self print];
}

#pragma mark -
#pragma mark field del

-(void)textFieldDidEndEditing:(UITextField*)field
{
    NSString *value = field.text;
    NSInteger valueint = value.integerValue;
    
    if(valueint < colormin)
    {
        valueint = colormin;
    }
    else if(valueint > colormax)
    {
        valueint = colormax;
    }
    
    self.model.value = valueint;
    [self.slider setValue:valueint animated:NO];
    [self.view.header refresh];
    [self print];
}

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end