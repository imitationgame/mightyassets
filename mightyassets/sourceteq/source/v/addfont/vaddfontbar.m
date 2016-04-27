#import "vaddfontbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "genericconstants.h"

@implementation vaddfontbar

-(instancetype)init:(caddfont*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor main]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:NSLocalizedString(@"addfont_title", nil)];
    
    UIButton *backbutton = [[UIButton alloc] init];
    [backbutton setClipsToBounds:YES];
    [backbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [backbutton.imageView setClipsToBounds:YES];
    [backbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [backbutton.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [backbutton addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:backbutton];
    
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