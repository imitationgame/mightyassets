#import "vaddheader.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vaddheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *name = [[UILabel alloc] init];
    [name setUserInteractionEnabled:NO];
    [name setBackgroundColor:[UIColor clearColor]];
    [name setTranslatesAutoresizingMaskIntoConstraints:NO];
    [name setFont:[UIFont boldsize:14]];
    [name setTextColor:[UIColor lighttext]];
    self.name = name;
    
    [self addSubview:name];
    
    NSDictionary *views = @{@"name":name};
    NSDictionary *metris = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[name]-5-|" options:0 metrics:metris views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[name(30)]-0-|" options:0 metrics:metris views:views]];
    
    return self;
}

-(void)config:(maddsection*)model
{
    [self.name setText:model.name];
}

@end