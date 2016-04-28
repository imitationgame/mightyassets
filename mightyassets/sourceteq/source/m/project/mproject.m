#import "mproject.h"
#import "mdb.h"
#import "mdirs.h"
#import "genericconstants.h"

@implementation mproject

+(mprojectitem*)newproject:(NSString*)name
{
    NSInteger created = [NSDate date].timeIntervalSince1970;
    NSInteger projectid = [mdb addproject:name created:created];
    
    [mproject folderforproject:projectid];
    
    mprojectitem *model = [[mprojectitem alloc] init:projectid created:created name:name];
    
    return model;
}

+(void)folderforproject:(NSInteger)projectid
{
    NSString *foldername = [NSString stringWithFormat:@"%@", @(projectid)];
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *projects = [documents stringByAppendingPathComponent:folderprojects];
    NSString *newfolder = [projects stringByAppendingPathComponent:foldername];
    
    [mdirs createdir:[NSURL fileURLWithPath:newfolder]];
}

-(instancetype)init
{
    self = [super init];
    
    self.items = [NSMutableArray array];
    NSArray<NSDictionary*> *rawprojects = [mdb fetchprojects];
    NSUInteger count = rawprojects.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawproject = rawprojects[i];
        NSString *rawname = rawproject[@"name"];
        NSInteger rawid = [rawproject[@"id"] integerValue];
        NSInteger rawcreated = [rawproject[@"created"] integerValue];
        
        mprojectitem *item = [[mprojectitem alloc] init:rawid created:rawcreated name:rawname];
        [self.items addObject:item];
    }
    
    return self;
}

@end