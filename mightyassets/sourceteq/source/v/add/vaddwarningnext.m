#import "vaddwarningnext.h"

@implementation vaddwarningnext

-(instancetype)init:(vadd*)view
{
    self = [super init:view];
    [self.label setText:NSLocalizedString(@"addscreen_warning_continue_label", nil)];
    [self.buttoncancel setTitle:NSLocalizedString(@"addscreen_warning_continue_btncancel", nil) forState:UIControlStateNormal];
    [self.buttoncontinue setTitle:NSLocalizedString(@"addscreen_warning_continue_btncontinue", nil) forState:UIControlStateNormal];
    
    return self;
}

@end