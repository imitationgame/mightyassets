#import "vlandingbar.h"
#import "uicolor+uicolormain.h"

@implementation vlandingbar

-(instancetype)init:(clanding*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonadd = [[UIButton alloc] init];
    [buttonadd setClipsToBounds:YES];
    [buttonadd setBackgroundColor:[UIColor whiteColor]];
    [buttonadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonadd setTitle:@"+" forState:UIControlStateNormal];
    [buttonadd setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonadd.layer setCornerRadius:20];
    
    [self addSubview:buttonadd];
    
    NSDictionary *views = @{@"buttonadd":buttonadd};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttonadd]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[buttonadd]-80-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end