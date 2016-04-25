#import "vaddcellscreensedit.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "madditemscreensedit.h"

static NSInteger const iconsize = 30;

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
    [icondonetitles setImage:[UIImage imageNamed:@"generic_done"]];
    self.icondonetitles = icondonetitles;
    
    UIImageView *icondoneimage = [[UIImageView alloc] init];
    [icondoneimage setContentMode:UIViewContentModeScaleAspectFit];
    [icondoneimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icondoneimage setUserInteractionEnabled:NO];
    [icondoneimage setClipsToBounds:YES];
    [icondoneimage setImage:[UIImage imageNamed:@"generic_done"]];
    self.icondoneimage = icondoneimage;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:16]];
    [label setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
    self.label = label;
    
    UILabel *labeltitles = [[UILabel alloc] init];
    [labeltitles setUserInteractionEnabled:NO];
    [labeltitles setFont:[UIFont boldsize:16]];
    [labeltitles setBackgroundColor:[UIColor clearColor]];
    [labeltitles setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
    [labeltitles setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitles setText:NSLocalizedString(@"madd_item_screensedit_cell_titles", nil)];
    
    UILabel *labelimage = [[UILabel alloc] init];
    [labelimage setUserInteractionEnabled:NO];
    [labelimage setFont:[UIFont boldsize:16]];
    [labelimage setBackgroundColor:[UIColor clearColor]];
    [labelimage setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
    [labelimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelimage setText:NSLocalizedString(@"madd_item_screensedit_cell_image", nil)];
    
    [self addSubview:label];
    [self addSubview:labeltitles];
    [self addSubview:labelimage];
    [self addSubview:icondonetitles];
    [self addSubview:icondoneimage];
    
    NSDictionary *views = @{@"icondonetitles":icondonetitles, @"icondoneimage":icondoneimage, @"label":label, @"labeltitles":labeltitles, @"labelimage":labelimage};
    NSDictionary *metric = @{};
    
    self.layouticontitleswidth = [NSLayoutConstraint constraintWithItem:icondonetitles attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    self.layouticonimagewidth = [NSLayoutConstraint constraintWithItem:icondoneimage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondonetitles]-5-[labeltitles(100)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondoneimage]-5-[labelimage(100)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label(20)]-20-[icondonetitles(30)]-10-[icondoneimage(30)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-[labeltitles(30)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icondonetitles]-10-[labelimage(30)]" options:0 metrics:metric views:views]];
    [self addConstraint:self.layouticonimagewidth];
    [self addConstraint:self.layouticontitleswidth];
    
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
    
    NSInteger iconimagewidth = 0;
    NSInteger icontitleswidth = 0;
    
    if(model.image)
    {
        iconimagewidth = iconsize;
    }
    
    if(model.titles.count == model.model.modelproject.languages.quantity)
    {
        icontitleswidth = iconsize;
    }
    
    self.layouticontitleswidth.constant = icontitleswidth;
    self.layouticonimagewidth.constant = iconimagewidth;
}

@end