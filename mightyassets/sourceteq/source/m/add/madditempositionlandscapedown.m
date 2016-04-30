#import "madditempositionlandscapedown.h"
#import "maddprocessorientationlandscape.h"

static NSInteger const percenttop = 30;
static NSInteger const percentbottom = 0;

@implementation madditempositionlandscapedown

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionlandscapedown_title", nil) asset:@"add_positiondown_landscape"];
    self.percenttop = percenttop;
    self.percentbottom = percentbottom;
    
    return self;
}

#pragma mark -
#pragma mark position item

-(maddprocessorientation*)orientationfor:(NSInteger)sideshort and:(NSInteger)sidelong
{
    maddprocessorientationlandscape *orientation = [[maddprocessorientationlandscape alloc] init:sideshort sidelong:sidelong];
    
    return orientation;
}

@end