#import "mprojectitem.h"
#import "genericconstants.h"

@implementation mprojectitem

-(instancetype)init:(NSInteger)itemid created:(NSInteger)created name:(NSString*)name
{
    self = [super init];
    self.itemid = itemid;
    self.created = created;
    self.name = name;
    
    return self;
}

#pragma mark public

-(void)addimage:(UIImage*)image name:(NSString*)name
{
    NSString *foldername = [NSString stringWithFormat:@"%@", @(self.itemid)];
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *projects = [documents stringByAppendingPathComponent:folderprojects];
    NSString *folder = [projects stringByAppendingPathComponent:foldername];
    NSString *imagename = [folder stringByAppendingPathComponent:name];
    NSURL *url = [NSURL fileURLWithPath:imagename];
    
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
}

@end