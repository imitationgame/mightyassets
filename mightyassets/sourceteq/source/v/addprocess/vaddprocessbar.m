#import "vaddprocessbar.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vaddprocessbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dictitle = @{NSFontAttributeName:[UIFont boldsize:18]};
    NSDictionary *dicdescr = @{NSFontAttributeName:[UIFont regularsize:14]};
    
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addprocess_title", nil) attributes:dictitle];
    NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"addprocess_descr", nil) attributes:dicdescr];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrdescr];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont regularsize:20]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(55)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end