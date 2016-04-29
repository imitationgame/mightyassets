#import "vprojectbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static NSInteger const height = 110;

@implementation vprojectbar

-(instancetype)init:(cproject*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    NSString *name = controller.model.name;
    
    if(!name.length)
    {
        name = NSLocalizedString(@"project_title_noname", nil);
    }
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:18]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:name];
    
    UIButton *backbutton = [[UIButton alloc] init];
    [backbutton setClipsToBounds:YES];
    [backbutton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [backbutton setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [backbutton.imageView setClipsToBounds:YES];
    [backbutton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [backbutton.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [backbutton addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    ;
    
    UIButton *buttonshare = [[UIButton alloc] init];
    [buttonshare setClipsToBounds:YES];
    [buttonshare setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonshare setImage:[[UIImage imageNamed:@"project_share"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonshare setImage:[[UIImage imageNamed:@"project_share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonshare.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonshare.imageView setClipsToBounds:YES];
    [buttonshare.imageView setTintColor:[UIColor whiteColor]];
    [buttonshare addTarget:self action:@selector(actionshare:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:backbutton];
    [self addSubview:buttonshare];
    
    NSDictionary *views = @{@"label":label, @"back":backbutton, @"share":buttonshare};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[share]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label(45)]-0-[share(40)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[back(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[back(45)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

#pragma mark functionality

-(void)actionshare:(UIButton*)button
{
    [self.controller.model share];
}

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end