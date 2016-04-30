#import "vaddcellprojectname.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "madditemprojectname.h"

@interface vaddcellprojectname ()

@property(weak, nonatomic)madditemprojectname *model;

@end

@implementation vaddcellprojectname

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"generic_type"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:[UIColor second]];
    [icon setClipsToBounds:YES];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont boldsize:20]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"madd_item_projectname_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor main]];
    [field setTintColor:[UIColor main]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:self];
    self.field = field;
    
    [self addSubview:icon];
    [self addSubview:field];
    
    NSDictionary *views = @{@"field":field, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[field]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[icon]-15-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemprojectname*)model topcollection:(UICollectionView*)topcollection
{
    [self.field setText:model.name];
    [super config:model topcollection:topcollection];
}

#pragma mark field del

-(void)textFieldDidEndEditing:(UITextField*)field
{
    self.model.name = field.text;
}

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end