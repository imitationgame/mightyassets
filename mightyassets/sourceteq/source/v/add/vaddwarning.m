#import "vaddwarning.h"

@implementation vaddwarning

-(instancetype)init:(vadd*)view
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.view = view;
    
    vblur *blur = [vblur light:NO];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    NSDictionary *metrics = @{};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:view]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:view]];
    
    return self;
}

@end