#import "vaddwarningcancel.h"

@implementation vaddwarningcancel

-(instancetype)init:(vadd*)view
{
    self = [super init:view];
    [self.label setText:NSLocalizedString(@"addscreen_warning_cancel_label", nil)];
    [self.buttoncancel setTitle:NSLocalizedString(@"addscreen_warning_cancel_btncancel", nil) forState:UIControlStateNormal];
    [self.buttoncontinue setTitle:NSLocalizedString(@"addscreen_warning_cancel_btncontinue", nil) forState:UIControlStateNormal];
    
    return self;
}

#pragma mark -
#pragma mark warning

-(void)actioncontinue:(UIButton*)button
{
    [self.view.controller cancel];
}

@end