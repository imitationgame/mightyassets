#import "maddsectionscreens.h"
#import "madditemscreensedit.h"
#import "madditemscreensadd.h"

@implementation maddsectionscreens

@dynamic items;

-(instancetype)init:(maddsectionproject*)modelproject
{
    self = [super init:NSLocalizedString(@"madd_section_screens_name", nil)];
    self.modelproject = modelproject;
    self.items = [NSMutableArray array];
    [self.items addObject:[[madditemscreensedit alloc] init:0 model:self]];
    [self.items addObject:[[madditemscreensadd alloc] init:self]];
    
    return self;
}

#pragma mark public

-(BOOL)completed
{
    BOOL completed = YES;
    
    for(madditem *item in self.items)
    {
        if([item isKindOfClass:[madditemscreensedit class]])
        {
            if(!((madditemscreensedit*)item).image)
            {
                completed = NO;
                
                break;
            }
        }
    }
    
    return completed;
}

@end