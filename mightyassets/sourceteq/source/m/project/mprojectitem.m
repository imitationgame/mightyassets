#import "mprojectitem.h"

@implementation mprojectitem

-(instancetype)init:(NSInteger)itemid created:(NSInteger)created name:(NSString*)name
{
    self = [super init];
    self.itemid = itemid;
    self.created = created;
    self.name = name;
    
    return self;
}

@end