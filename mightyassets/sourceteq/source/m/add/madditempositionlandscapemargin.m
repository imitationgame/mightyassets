#import "madditempositionlandscapemargin.h"
#import "maddprocessorientationlandscape.h"

static NSInteger const percenttop = 17;
static NSInteger const percentbottom = 15;

@implementation madditempositionlandscapemargin

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_positionlandscapemargin_title", nil) asset:@"add_positionmargin_landscape"];
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