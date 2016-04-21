#import "vlanding.h"
#import "vlandingbar.h"
#import "vlandingclearheader.h"
#import "vlandingcell.h"
#import "genericconstants.h"

static NSInteger const barheight = 200;

@implementation vlanding

-(instancetype)init:(clanding*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vlandingbar *bar = [[vlandingbar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

@end