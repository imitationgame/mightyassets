#import "vaddcolorbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "genericconstants.h"

@implementation vaddcolorbar

-(instancetype)init:(caddcolor*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor background]];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    
    NSString *texttitle = [NSString stringWithFormat:NSLocalizedString(@"addcolor_title", nil), controller.model.title];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:16]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:texttitle];
    
    UIButton *backbutton = [[UIButton alloc] init];
    [backbutton setClipsToBounds:YES];
    [backbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [backbutton.imageView setClipsToBounds:YES];
    [backbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [backbutton.imageView setTintColor:[UIColor blackColor]];
    [backbutton addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addbutton = [[UIButton alloc] init];
    [addbutton setClipsToBounds:YES];
    [addbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [addbutton setImage:[[UIImage imageNamed:@"generic_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [addbutton setImage:[[UIImage imageNamed:@"generic_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [addbutton.imageView setClipsToBounds:YES];
    [addbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [addbutton.imageView setTintColor:[UIColor blackColor]];
    [addbutton setImageEdgeInsets:UIEdgeInsetsMake(9, 15, 9, 0)];
    [addbutton addTarget:self action:@selector(actionadd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:border];
    [self addSubview:label];
    [self addSubview:backbutton];
    [self addSubview:addbutton];
    
    NSDictionary *views = @{@"border":border, @"label":label, @"back":backbutton, @"add":addbutton};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[border]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[back(45)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[add(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[add(45)]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)actionadd:(UIButton*)button
{
    [self.controller add];
}

@end