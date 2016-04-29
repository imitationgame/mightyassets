#import "vaddscreenbar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"
#import "uifont+uifontmain.h"

@implementation vaddscreenbar

-(instancetype)init:(caddscreen*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    NSInteger index = controller.model.index + 1;
    NSString *texttitle = [NSString stringWithFormat:NSLocalizedString(@"addscreen_title", nil), @(index)];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:texttitle];
    
    UIButton *backbutton = [[UIButton alloc] init];
    [backbutton setClipsToBounds:YES];
    [backbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [backbutton.imageView setClipsToBounds:YES];
    [backbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [backbutton.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [backbutton addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonremove = [[UIButton alloc] init];
    [buttonremove setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonremove setImage:[[UIImage imageNamed:@"generic_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonremove setImage:[[UIImage imageNamed:@"generic_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonremove.imageView setClipsToBounds:YES];
    [buttonremove.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonremove.imageView setTintColor:[UIColor blackColor]];
    [buttonremove setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 15, 15)];
    
    [self addSubview:label];
    [self addSubview:backbutton];
    [self addSubview:buttonremove];
    
    NSDictionary *views = @{@"label":label, @"back":backbutton};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[back(45)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end