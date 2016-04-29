#import "vaddscreenfooter.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "cmain.h"

static NSInteger const screenwidth = 160;
static NSInteger const circlesize = 70;

@implementation vaddscreenfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat width = frame.size.width;
    CGFloat circleleft = (width - circlesize) / 2.0;
    CGFloat screenleft = (width - screenwidth) / 2.0;
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:20], NSForegroundColorAttributeName:[UIColor main]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:1]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_title", nil) attributes:dicttitle];
    NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addscreen_image_descr", nil) attributes:dictdescr];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrdescr];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image.layer setCornerRadius:5];
    [image.layer setBorderColor:[UIColor second].CGColor];
    self.image = image;
    
    UIImageView *iconadd = [[UIImageView alloc] init];
    [iconadd setClipsToBounds:YES];
    [iconadd setContentMode:UIViewContentModeCenter];
    [iconadd setTranslatesAutoresizingMaskIntoConstraints:NO];
    [iconadd setUserInteractionEnabled:NO];
    [iconadd setImage:[UIImage imageNamed:@"add_screen"]];
    
    UIView *circle = [[UIView alloc] init];
    [circle setBackgroundColor:[UIColor second]];
    [circle setClipsToBounds:YES];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:circlesize / 2.0];
    self.circle = circle;
    
    UIButton *buttonupload = [[UIButton alloc] init];
    [buttonupload setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonupload setBackgroundColor:[UIColor clearColor]];
    [buttonupload addTarget:self action:@selector(actionupload:) forControlEvents:UIControlEventTouchDown];
    
    [circle addSubview:iconadd];
    [self addSubview:label];
    [self addSubview:circle];
    [self addSubview:image];
    [self addSubview:buttonupload];
    
    NSDictionary *views = @{@"label":label, @"iconadd":iconadd, @"circle":circle, @"image":image, @"button":buttonupload};
    NSDictionary *metrics = @{@"circlesize":@(circlesize), @"circleleft":@(circleleft), @"screenleft":@(screenleft), @"screenwidth":@(screenwidth)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(circleleft)-[circle(circlesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[circle(circlesize)]-100-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[iconadd]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[iconadd]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(screenleft)-[image(screenwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(screenleft)-[button(screenwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[image]-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button]-20-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionupload:(UIButton*)button
{
    [self uploadpicture];
}

#pragma mark functionality

-(void)display
{
    if(self.model.image)
    {
        [self.image setImage:self.model.image];
        [self.circle setHidden:YES];
        [self.image.layer setBorderWidth:0];
    }
    else
    {
        [self.image setImage:nil];
        [self.circle setHidden:NO];
        [self.image.layer setBorderWidth:1];
    }
}

-(void)uploadpicture
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        self.popover = popover;
        [popover presentPopoverFromRect:self.circle.bounds inView:self.circle permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else
    {
        [[cmain singleton] presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark public

-(void)config:(madditemscreensedit*)model
{
    self.model = model;
    [self display];
}

#pragma mark -
#pragma mark picker del

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    self.model.image = info[UIImagePickerControllerOriginalImage];
    
    if(self.popover)
    {
        [self.popover dismissPopoverAnimated:YES];
    }
    else
    {
        [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
    }
    
    [self display];
}

@end