#import "vaddwarning.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static CGFloat const animationduration = 0.6;

@implementation vaddwarning

-(instancetype)init:(vadd*)view
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    self.view = view;
    
    vblur *blur = [vblur light:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:18]];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor main]];
    self.label = label;
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel setClipsToBounds:YES];
    [buttoncancel setBackgroundColor:[UIColor main]];
    [buttoncancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttoncancel.layer setCornerRadius:4];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    self.buttoncancel = buttoncancel;
    
    UIButton *buttoncontinue = [[UIButton alloc] init];
    [buttoncontinue setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncontinue setClipsToBounds:YES];
    [buttoncontinue setBackgroundColor:[UIColor second]];
    [buttoncontinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttoncontinue setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttoncontinue.layer setCornerRadius:4];
    [buttoncontinue addTarget:self action:@selector(actioncontinue:) forControlEvents:UIControlEventTouchUpInside];
    self.buttoncontinue = buttoncontinue;
    
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:buttoncancel];
    [self addSubview:buttoncontinue];
    
    NSDictionary *views = @{@"self":self, @"blur":blur, @"label":label, @"buttoncancel":buttoncancel, @"buttoncontinue":buttoncontinue};
    NSDictionary *metrics = @{};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttoncancel]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttoncontinue]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label(100)]-0-[buttoncancel(34)]-20-[buttoncontinue(34)]" options:0 metrics:metrics views:views]];
    
    __weak typeof(self) welf = self;
    
    [UIView animateWithDuration:animationduration animations:
     ^
     {
         [welf setAlpha:1];
     }];
    
    return self;
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    __weak typeof(self) welf = self;
    
    [UIView animateWithDuration:animationduration animations:
     ^
     {
         [welf setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [welf removeFromSuperview];
     }];
}

#pragma mark public

-(void)actioncontinue:(UIButton*)button
{
    
}

@end