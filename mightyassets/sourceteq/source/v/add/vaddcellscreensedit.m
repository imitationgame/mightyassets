#import "vaddcellscreensedit.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "madditemscreensedit.h"

@interface vaddcellscreensedit ()

@property(weak, nonatomic)madditemscreensedit *model;

@end

@implementation vaddcellscreensedit

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *icondonetitles = [[UIImageView alloc] init];
    [icondonetitles setContentMode:UIViewContentModeScaleAspectFit];
    [icondonetitles setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icondonetitles setUserInteractionEnabled:NO];
    [icondonetitles setClipsToBounds:YES];
    [icondonetitles setImage:[[UIImage imageNamed:@"generic_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icondonetitles setTintColor:[UIColor lighttext]];
    self.icondonetitles = icondonetitles;
    
    UIImageView *icondoneimage = [[UIImageView alloc] init];
    [icondoneimage setContentMode:UIViewContentModeScaleAspectFit];
    [icondoneimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icondoneimage setUserInteractionEnabled:NO];
    [icondoneimage setClipsToBounds:YES];
    [icondoneimage setImage:[[UIImage imageNamed:@"generic_done"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icondoneimage setTintColor:[UIColor lighttext]];
    self.icondoneimage = icondoneimage;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:16]];
    [label setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
    self.label = label;
    
    self.coloroff = [UIColor colorWithWhite:0.9 alpha:1];
    self.coloron = [UIColor main];
    
    [self addSubview:label];
    [self addSubview:icondonetitles];
    [self addSubview:icondoneimage];
    
    NSDictionary *views = @{@"icondonetitles":icondonetitles, @"icondoneimage":icondoneimage, @"label":label};
    NSDictionary *metric = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondonetitles(30)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondoneimage(30)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label(20)]-20-[icondonetitles(30)]-10-[icondoneimage(30)]" options:0 metrics:metric views:views]];
    
    return self;
}

#pragma mark functionality

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
        [self setAlpha:0.2];
    }
    else
    {
        [self setAlpha:1];
    }
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemscreensedit*)model
{
    NSInteger index = model.index + 1;
    NSString *stringtitle = [NSString stringWithFormat:NSLocalizedString(@"madd_item_screensedit_cell_title", nil), @(index)];
    [self.label setText:stringtitle];
    [self hover];
    
    UIColor *colorimage;
    UIColor *colortitles;
    
    if(model.image)
    {
        colorimage = self.coloron;
    }
    else
    {
        colorimage = self.coloroff;
    }
    
    if(model.titles.count == model.model.modelproject.languages.quantity)
    {
        colortitles = self.coloron;
    }
    else
    {
        colortitles = self.coloroff;
    }
    
    [self.icondonetitles setTintColor:colortitles];
    [self.icondoneimage setTintColor:colorimage];
}

@end