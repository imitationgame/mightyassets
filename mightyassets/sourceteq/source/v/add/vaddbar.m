#import "vaddbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vaddbar

-(instancetype)init:(cadd*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
 
    UILabel *title = [[UILabel alloc] init];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont boldsize:16]];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setUserInteractionEnabled:NO];
    [title setText:NSLocalizedString(@"add_title", nil)];
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[title]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(45)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end