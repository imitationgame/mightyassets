#import "mprojectitem.h"
#import "genericconstants.h"
#import "cmain.h"
#import "mdb.h"

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
    NSString *folder = [self folderpath];
    NSString *imagename = [folder stringByAppendingPathComponent:name];
    NSURL *url = [NSURL fileURLWithPath:imagename];
    
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
}

-(mprojectitempics*)pics
{
    mprojectitempics *pics = [[mprojectitempics alloc] init:self];
    
    return pics;
}

-(NSString*)folderpath
{
    NSString *foldername = [NSString stringWithFormat:@"%@", @(self.itemid)];
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *projects = [documents stringByAppendingPathComponent:folderprojects];
    NSString *folder = [projects stringByAppendingPathComponent:foldername];
    
    return folder;
}

-(void)share
{
    NSString *folderpath = [self folderpath];
    NSURL *urlfolder = [NSURL fileURLWithPath:folderpath];
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[urlfolder] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = [cmain singleton].view;
        act.popoverPresentationController.sourceRect = CGRectMake(([cmain singleton].view.bounds.size.width / 2.0) - 2, [cmain singleton].view.bounds.size.height - 100, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

-(void)remove
{
    [mdb deleteproject:self.itemid];
    NSString *folderpath = [self folderpath];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSURL *url = [NSURL fileURLWithPath:folderpath];
                       NSFileManager *manager = [NSFileManager defaultManager];
                       [manager removeItemAtURL:url error:nil];
                   });
}

@end