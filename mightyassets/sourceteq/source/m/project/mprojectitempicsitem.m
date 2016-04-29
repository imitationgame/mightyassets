#import "mprojectitempicsitem.h"
#import "tools.h"

@implementation mprojectitempicsitem

-(instancetype)init:(NSURL*)url
{
    self = [super init];
    self.url = url;
    
    self.buffer = [UIImage imageWithContentsOfFile:url.path];
    self.imagename = url.lastPathComponent;
    self.imagewidth = self.buffer.size.width;
    self.imageheight = self.buffer.size.height;
    
    return self;
}

#pragma mark public

-(void)loadbuffer
{
    self.image = [tools bufferimage:self.buffer];
    self.buffer = nil;
}

@end