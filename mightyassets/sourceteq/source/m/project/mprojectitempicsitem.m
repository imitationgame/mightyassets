#import "mprojectitempicsitem.h"

@implementation mprojectitempicsitem

-(instancetype)init:(NSURL*)url
{
    self = [super init];
    self.url = url;
    self.image = [UIImage imageWithContentsOfFile:url.path];
    self.imagename = url.lastPathComponent;
    self.imagewidth = self.image.size.width;
    self.imageheight = self.image.size.height;
    
    return self;
}

@end