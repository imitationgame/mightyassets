#import "mprojectitempicsitemconstraints.h"

@implementation mprojectitempicsitemconstraints

+(instancetype)imagewidth:(NSInteger)imagewidth imageheight:(NSInteger)imageheight maxwidth:(NSInteger)maxwidth maxheight:(NSInteger)maxheight textheight:(NSInteger)textheight
{
    mprojectitempicsitemconstraints *constraints = [[mprojectitempicsitemconstraints alloc] init];
    
    CGFloat usablewidth = maxwidth;
    CGFloat usableheight = maxheight - textheight;
    CGFloat ratiowidth = imagewidth / usablewidth;
    CGFloat ratioheight = imageheight / usableheight;
    CGFloat maxratio = MAX(ratiowidth, ratioheight);
    CGFloat scaledwidth = imagewidth / maxratio;
    CGFloat scaledheight = imageheight / maxratio;
    NSInteger cellwidth = scaledwidth;
    NSInteger cellheight = scaledheight;
    NSInteger margintop = usableheight - cellheight;
    constraints.cellwidth = cellwidth;
    constraints.cellheight = cellheight + textheight;
    constraints.insetstop = margintop;
    
    return constraints;
}

@end