#import "vaddbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "vaddwarningnext.h"
#import "vaddwarningcancel.h"

@implementation vaddbar

-(instancetype)init:(vadd*)view
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.view = view;
 
    UILabel *title = [[UILabel alloc] init];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont boldsize:16]];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setUserInteractionEnabled:NO];
    [title setText:NSLocalizedString(@"add_title", nil)];
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel setImage:[[UIImage imageNamed:@"generic_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttoncancel setImage:[[UIImage imageNamed:@"generic_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttoncancel.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttoncancel.imageView setClipsToBounds:YES];
    [buttoncancel.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonnext = [[UIButton alloc] init];
    [buttonnext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonnext setImage:[[UIImage imageNamed:@"generic_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonnext setImage:[[UIImage imageNamed:@"generic_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonnext.imageView setTintColor:[UIColor whiteColor]];
    [buttonnext.imageView setClipsToBounds:YES];
    [buttonnext.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonnext addTarget:self action:@selector(actionnext:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:title];
    [self addSubview:buttoncancel];
    [self addSubview:buttonnext];
    
    NSDictionary *views = @{@"title":title, @"buttoncancel":buttoncancel, @"buttonnext":buttonnext};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[title]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttoncancel(46)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonnext(46)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttoncancel(25)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonnext(25)]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    __unused vaddwarningcancel *warning = [[vaddwarningcancel alloc] init:self.view];
}

-(void)actionnext:(UIButton*)button
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if([self.view.model.modelscreens completed])
    {
        [self.view.controller next];
    }
    else
    {
        __unused vaddwarningnext *warning = [[vaddwarningnext alloc] init:self.view];
    }
}

@end