#import "vaddprocess.h"

@implementation vaddprocess

-(instancetype)init:(caddprocess*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    self.controller = controller;

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end