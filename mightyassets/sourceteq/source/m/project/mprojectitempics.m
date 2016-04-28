#import "mprojectitempics.h"
#import "mprojectitem.h"

@implementation mprojectitempics

-(instancetype)init:(mprojectitem*)model
{
    self = [super init];
    self.model = model;
    
    NSString *folderpath = [model folderpath];
    NSURL *folderurl = [NSURL fileURLWithPath:folderpath];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *contents = [manager contentsOfDirectoryAtURL:folderurl includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    
    NSLog(@"%@", contents);
    
    return self;
}

@end