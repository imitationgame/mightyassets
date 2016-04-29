#import "vaddcellscreensedit.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "madditemscreensedit.h"

static NSInteger const iconsize = 20;
static NSInteger const warningsize = 45;

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
    
    UIImageView *iconwarning = [[UIImageView alloc] init];
    [iconwarning setContentMode:UIViewContentModeScaleAspectFit];
    [iconwarning setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconwarning setUserInteractionEnabled:NO];
    [iconwarning setClipsToBounds:YES];
    [iconwarning setImage:[UIImage imageNamed:@"generic_warning"]];
    self.iconwarning = iconwarning;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:16]];
    [label setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    self.label = label;
    
    UILabel *labeltitles = [[UILabel alloc] init];
    [labeltitles setUserInteractionEnabled:NO];
    [labeltitles setFont:[UIFont boldsize:16]];
    [labeltitles setBackgroundColor:[UIColor clearColor]];
    [labeltitles setTextColor:[UIColor colorWithWhite:0.75 alpha:1]];
    [labeltitles setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitles setText:NSLocalizedString(@"madd_item_screensedit_cell_titles", nil)];
    
    UILabel *labelimage = [[UILabel alloc] init];
    [labelimage setUserInteractionEnabled:NO];
    [labelimage setFont:[UIFont boldsize:16]];
    [labelimage setBackgroundColor:[UIColor clearColor]];
    [labelimage setTextColor:[UIColor colorWithWhite:0.75 alpha:1]];
    [labelimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelimage setText:NSLocalizedString(@"madd_item_screensedit_cell_image", nil)];
    
    [self addSubview:label];
    [self addSubview:labeltitles];
    [self addSubview:labelimage];
    [self addSubview:icondonetitles];
    [self addSubview:icondoneimage];
    [self addSubview:iconwarning];
    
    NSDictionary *views = @{@"icondonetitles":icondonetitles, @"icondoneimage":icondoneimage, @"label":label, @"labeltitles":labeltitles, @"labelimage":labelimage, @"iconwarning":iconwarning};
    NSDictionary *metric = @{};
    
    self.layouticontitleswidth = [NSLayoutConstraint constraintWithItem:icondonetitles attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    self.layouticonimagewidth = [NSLayoutConstraint constraintWithItem:icondoneimage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    self.layouticonwarningwidth = [NSLayoutConstraint constraintWithItem:iconwarning attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[iconwarning]-0-[label]-10-|" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondonetitles]-5-[labeltitles(100)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icondoneimage]-5-[labelimage(100)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(20)]-10-[icondonetitles(20)]-10-[icondoneimage(20)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-10-[labeltitles(20)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icondonetitles]-10-[labelimage(20)]" options:0 metrics:metric views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[iconwarning(20)]" options:0 metrics:metric views:views]];
    [self addConstraint:self.layouticonimagewidth];
    [self addConstraint:self.layouticontitleswidth];
    [self addConstraint:self.layouticonwarningwidth];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemscreensedit*)model
{
    NSInteger index = model.index + 1;
    NSString *stringtitle = [NSString stringWithFormat:NSLocalizedString(@"madd_item_screensedit_cell_title", nil), @(index)];
    [self.label setText:stringtitle];
    
    NSInteger iconimagewidth = 0;
    NSInteger icontitleswidth = 0;
    
    if(model.image)
    {
        iconimagewidth = iconsize;
        self.layouticonwarningwidth.constant = 0;
    }
    else
    {
        self.layouticonwarningwidth.constant = warningsize;
    }
    
    if([model titlescompleted] >= model.model.modelproject.modellanguages.quantity)
    {
        icontitleswidth = iconsize;
    }
    
    self.layouticontitleswidth.constant = icontitleswidth;
    self.layouticonimagewidth.constant = iconimagewidth;
    
    [super config:model];
}

@end