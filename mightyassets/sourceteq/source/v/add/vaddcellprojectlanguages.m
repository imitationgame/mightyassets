#import "vaddcellprojectlanguages.h"
#import "madditemprojectlanguages.h"

@interface vaddcellprojectlanguages ()

@property(weak, nonatomic)madditemprojectlanguages *model;

@end

@implementation vaddcellprojectlanguages

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemprojectlanguages*)model
{
    [super config:model];
}

@end