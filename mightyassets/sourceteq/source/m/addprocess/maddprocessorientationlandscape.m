#import "maddprocessorientationlandscape.h"

@implementation maddprocessorientationlandscape

-(instancetype)init:(NSInteger)sideshort sidelong:(NSInteger)sidelong
{
    self = [super init];
    self.width = sidelong;
    self.height = sideshort;
    
    return self;
}

#pragma mark -
#pragma mark orientation

-(UIImage*)imageoriented:(UIImage*)image
{
    UIImage *newimage = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationLeft];
    
    return image;
}

@end