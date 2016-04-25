#import "vaddcellpositioncell.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vaddcellpositioncell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *name = [[UILabel alloc] init];
    [name setUserInteractionEnabled:NO];
    [name setBackgroundColor:[UIColor clearColor]];
    [name setFont:[UIFont regularsize:16]];
    [name setTextAlignment:NSTextAlignmentCenter];
    [name setTranslatesAutoresizingMaskIntoConstraints:NO];
    [name setTextColor:[UIColor main]];
    self.name = name;
    
    UIImageView *asset = [[UIImageView alloc] init];
    [asset setTranslatesAutoresizingMaskIntoConstraints:NO];
    [asset setClipsToBounds:YES];
    [asset setContentMode:UIViewContentModeScaleAspectFit];
    [asset setUserInteractionEnabled:NO];
    self.asset = asset;
    
    [self addSubview:asset];
    [self addSubview:name];
    
    NSDictionary *views = @{@"name":name, @"asset":asset};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[asset]-0-[name(30)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[asset]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:1];
    }
    else
    {
        [self setAlpha:0.5];
    }
}

#pragma mark public

-(void)config:(madditempositionitem*)model
{
    [self.name setText:model.name];
    [self.asset setImage:[UIImage imageNamed:model.asset]];
}

@end