#import "mprojectitempics.h"
#import "mprojectitem.h"

@implementation mprojectitempics

-(instancetype)init:(mprojectitem*)model
{
    self = [super init];
    self.items = [NSMutableArray array];
    self.model = model;

    NSString *folderpath = [model folderpath];
    NSURL *folderurl = [NSURL fileURLWithPath:folderpath];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray<NSURL*> *contents = [manager contentsOfDirectoryAtURL:folderurl includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
    NSUInteger counturl = contents.count;
    
    for(NSUInteger indexurl = 0; indexurl < counturl; indexurl++)
    {
        NSURL *url = contents[indexurl];
        mprojectitempicsitem *pic = [[mprojectitempicsitem alloc] init:url];
        [self.items addObject:pic];
    }
    
    return self;
}

@end