#import "vprojectcell.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vprojectcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    self.attrname = @{NSFontAttributeName:[UIFont boldsize:15], NSForegroundColorAttributeName:[UIColor main]};
    self.attrdescr = @{NSFontAttributeName:[UIFont regularsize:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:1]};
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setBorderWidth:1];
    [image.layer setBorderColor:[UIColor background].CGColor];
    self.image = image;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setBackgroundColor:[UIColor clearColor]];
    self.label = label;
    
    [self addSubview:label];
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image, @"label":label};
    NSDictionary *metrics = @{};
    
    self.layoutlabelheight = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelheight];
    
    return self;
}

#pragma mark public

-(void)config:(mprojectitempicsitem*)model textheight:(NSInteger)textheight
{
    self.layoutlabelheight.constant = textheight;
    [self.image setImage:model.image];
    
    NSString *name = model.imagename;
    NSString *width = [NSString stringWithFormat:NSLocalizedString(@"project_title_sizes_width", nil), @(model.imagewidth)];
    NSString *height = [NSString stringWithFormat:NSLocalizedString(@"project_title_sizes_height", nil), @(model.imageheight)];
    NSAttributedString *stringname = [[NSAttributedString alloc] initWithString:name attributes:self.attrname];
    NSAttributedString *stringwidth = [[NSAttributedString alloc] initWithString:width attributes:self.attrdescr];
    NSAttributedString *stringheight = [[NSAttributedString alloc] initWithString:height attributes:self.attrdescr];
    NSMutableAttributedString *mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:stringname];
    [mutstring appendAttributedString:stringwidth];
    [mutstring appendAttributedString:stringheight];
    
    [self.label setAttributedText:mutstring];
}

@end