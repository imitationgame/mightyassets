#import "mproject.h"
#import "mdb.h"

@implementation mproject

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