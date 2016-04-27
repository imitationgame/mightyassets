#import "vaddcellprojectdevices.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "madditemprojectdevices.h"

static NSInteger const segmentedwidth = 280;
static NSInteger const segmentedheight = 34;

@interface vaddcellprojectdevices ()

@property(weak, nonatomic)madditemprojectdevices *model;

@end

@implementation vaddcellprojectdevices
{
    NSInteger segmentedleft;
    NSInteger segmentedtop;
}

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    NSInteger width = frame.size.width;
    NSInteger height = frame.size.height;
    NSInteger remainh = width - segmentedwidth;
    NSInteger remainv = height - segmentedheight;
    segmentedleft = remainh / 2.0;
    segmentedtop = remainv / 2.0;
    
    return self;
}

#pragma mark actions

-(void)actionsegmented:(UISegmentedControl*)segmented
{
    self.model.selected = segmented.selectedSegmentIndex;
}

#pragma mark functionality

-(void)createsegmented
{
    NSArray *titles = [self.model titles];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont regularsize:14]};
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:titles];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    [segmented setClipsToBounds:YES];
    [segmented setTintColor:[UIColor main]];
    [segmented setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [segmented addTarget:self action:@selector(actionsegmented:) forControlEvents:UIControlEventValueChanged];
    self.segmented = segmented;
    
    [self addSubview:segmented];
    
    NSDictionary *views = @{@"segmented":segmented};
    NSDictionary *metrics = @{@"top":@(segmentedtop), @"left":@(segmentedleft), @"width":@(segmentedwidth), @"height":@(segmentedheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[segmented(width)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[segmented(height)]" options:0 metrics:metrics views:views]];
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
    
    [self.segmented setSelectedSegmentIndex:model.selected];
}

@end