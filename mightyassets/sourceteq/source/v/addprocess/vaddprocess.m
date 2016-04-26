#import "vaddprocess.h"
#import "vaddprocessbar.h"

static NSInteger const barheight = 150;

@implementation vaddprocess

-(instancetype)init:(caddprocess*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    self.controller = controller;

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    vaddprocessbar *bar = [[vaddprocessbar alloc] init];
    
    [self addSubview:spinner];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"spinner":spinner, @"bar":bar};
    NSDictionary *metrics = @{@"barheight":@(barheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]-100-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end