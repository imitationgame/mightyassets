#import "vaddcellprojectlanguages.h"
#import "madditemprojectlanguages.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static NSInteger const minvalue = 1;
static NSInteger const maxvalue = 3;

@interface vaddcellprojectlanguages ()

@property(weak, nonatomic)madditemprojectlanguages *model;

@end

@implementation vaddcellprojectlanguages

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont regularsize:16], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.3 alpha:1]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:13], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.55 alpha:1]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"madd_item_projectlanguages_title", nil) attributes:dicttitle];
    NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"madd_item_projectlanguages_descr", nil) attributes:dictdescr];
    NSMutableAttributedString *mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:attrtitle];
    [mutstring appendAttributedString:attrdescr];
    
    UIStepper *stepper = [[UIStepper alloc] init];
    [stepper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stepper setMinimumValue:minvalue];
    [stepper setMaximumValue:maxvalue];
    [stepper setTintColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [stepper addTarget:self action:@selector(actionstepper:) forControlEvents:UIControlEventValueChanged];
    self.stepper = stepper;
    
    UILabel *labelquantity = [[UILabel alloc] init];
    [labelquantity setBackgroundColor:[UIColor clearColor]];
    [labelquantity setUserInteractionEnabled:NO];
    [labelquantity setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelquantity setFont:[UIFont boldsize:25]];
    [labelquantity setTextAlignment:NSTextAlignmentRight];
    [labelquantity setTextColor:[UIColor main]];
    self.labelquantity = labelquantity;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setNumberOfLines:0];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setAttributedText:mutstring];
    
    [self addSubview:labelquantity];
    [self addSubview:labeltitle];
    [self addSubview:stepper];
    
    NSDictionary *views = @{@"stepper":stepper, @"labelquantity":labelquantity, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labeltitle]-0-[labelquantity(35)]-10-[stepper(110)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[stepper]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[labelquantity(32)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionstepper:(UIStepper*)stepper
{
    self.model.quantity = stepper.value;
    [self print];
}

#pragma mark functionality

-(void)print
{
    NSInteger value = self.stepper.value;
    NSString *strnum = [NSString stringWithFormat:@"%@", @(value)];
    [self.labelquantity setText:strnum];
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemprojectlanguages*)model
{
    [self.stepper setValue:model.quantity];
    [self print];
    [super config:model];
}

@end