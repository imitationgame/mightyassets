#import "madditempositionportraitfull.h"
#import "maddprocessorientationportrait.h"

static NSInteger const percenttop = 15;
static NSInteger const percentbottom = 5;

@implementation madditempositionportraitfull

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionportraitfull_title", nil) asset:@"add_positionfull_portrait"];
    self.percenttop = percenttop;
    self.percentbottom = percentbottom;
    
    return self;
}

#pragma mark -
#pragma mark position item

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    maddprocessorientationportrait *orientation = [[maddprocessorientationportrait alloc] init:sideshort sidelong:sidelong];
    
    return orientation;
}

@end