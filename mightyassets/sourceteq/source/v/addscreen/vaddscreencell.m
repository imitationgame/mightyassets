#import "vaddscreencell.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vaddscreencell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setBackgroundColor:[UIColor background]];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont regularsize:18]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"addscreen_titles_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [field setTintColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:self];
    self.field = field;
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:field];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"borderbottom":borderbottom, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bordertop]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[borderbottom]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(madditemscreensedittitle*)model
{
    self.model = model;
}

#pragma mark -
#pragma mark field del

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end