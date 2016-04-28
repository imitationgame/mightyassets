#import "vlandingcell.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "tools.h"

@implementation vlandingcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.attributesname = @{NSFontAttributeName:[UIFont boldsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.3 alpha:1]};
    self.attributescreated = @{NSFontAttributeName:[UIFont regularsize:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.65 alpha:1]};
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setBackgroundColor:[UIColor background]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setBackgroundColor:[UIColor clearColor]];
    self.label = label;
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:label];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"borderbottom":borderbottom, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[borderbottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:0.2];
    }
    else
    {
        [self setAlpha:1];
    }
}

#pragma mark public

-(void)config:(mprojectitem*)model
{
    NSString *name = model.name;
    NSString *created = [NSString stringWithFormat:NSLocalizedString(@"landing_cell_created", nil), [tools elapsedtimefrom:model.created]];
    
    if(!name.length)
    {
        name = NSLocalizedString(@"landing_cell_noname", nil);
    }
    
    NSAttributedString *stringname = [[NSAttributedString alloc] initWithString:name attributes:self.attributesname];
    NSAttributedString *stringcreated = [[NSAttributedString alloc] initWithString:created attributes:self.attributescreated];
    NSMutableAttributedString *mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:stringname];
    [mutstring appendAttributedString:stringcreated];
    
    [self.label setAttributedText:mutstring];
}

@end