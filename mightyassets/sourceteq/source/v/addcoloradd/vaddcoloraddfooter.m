#import "vaddcoloraddfooter.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static NSInteger const buttonwidth = 130;
static NSInteger const buttonheight = 36;

@implementation vaddcoloraddfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor main]];
    [button setClipsToBounds:YES];
    [button setTitle:NSLocalizedString(@"addcoloradd_color_accept", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont boldsize:15]];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.layer setCornerRadius:6];
    [button addTarget:self action:@selector(actiondone:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat remainwidth = width - buttonwidth;
    CGFloat remainheight = height - buttonheight;
    CGFloat left = remainwidth / 2.0;
    CGFloat top = remainheight / 2.0;
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{@"left":@(left), @"top":@(top), @"width":@(buttonwidth), @"height":@(buttonheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[button(width)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[button(height)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actiondone:(UIButton*)button
{
    UIColor *color = self.view.header.circle.tintColor;
    [self.view.controller changecolor:color];
}

#pragma mark public

-(void)config:(vaddcoloradd*)view
{
    self.view = view;
}

@end