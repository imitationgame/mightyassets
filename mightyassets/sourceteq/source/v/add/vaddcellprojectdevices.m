#import "vaddcellprojectdevices.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "madditemprojectdevices.h"

@implementation vaddcellprojectdevices

#pragma mark actions

-(void)actionsegmented:(UISegmentedControl*)segmented
{
    
}

#pragma mark functionality

-(void)createsegmented
{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont regularsize:15]};
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] init];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    [segmented setClipsToBounds:YES];
    [segmented setTintColor:[UIColor main]];
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemprojectdevices*)model
{
    [super config:model];
    
    if(!self.segmented)
    {
        [self createsegmented];
    }
    
    
}

@end