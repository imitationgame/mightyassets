#import "vprojectcell.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static CGFloat const animationduration = 0.3;

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
    [image.layer setCornerRadius:7];
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
    [self.image setImage:nil];
    [self.image setAlpha:0];
    self.layoutlabelheight.constant = textheight;
    
    NSString *name = model.imagename;
    NSString *width = [NSString stringWithFormat:NSLocalizedString(@"project_title_sizes_width", nil), @(model.imagewidth)];
    NSString *height = [NSString stringWithFormat:NSLocalizedString(@"project_title_sizes_height", nil), @(model.imageheight)];
    NSAttributedString *stringname = [[NSAttributedString alloc] initWithString:name attributes:self.attrname];
    NSAttributedString *stringwidth = [[NSAttributedString alloc] initWithString:width attributes:self.attrdescr];
    NSAttributedString *stringheight = [[NSAttributedString alloc] initWithString:height attributes:self.attrdescr];
    NSMutableAttributedString *mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:stringwidth];
    [mutstring appendAttributedString:stringheight];
    [mutstring appendAttributedString:stringname];
    
    [self.label setAttributedText:mutstring];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if(!model.image)
                       {
                           [model loadbuffer];
                       }
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.image setImage:model.image];
                                          
                                          [UIView animateWithDuration:animationduration animations:
                                           ^
                                           {
                                               [welf.image setAlpha:1];
                                           }];
                                      });
                   });
}

@end