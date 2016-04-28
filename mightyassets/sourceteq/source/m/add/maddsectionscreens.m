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

-(void)clean
{
    NSInteger shouldhave = self.modelproject.modellanguages.quantity;
    
    for(madditem *item in self.items)
    {
        if([item isKindOfClass:[madditemscreensedit class]])
        {
            madditemscreensedit *edititem = (madditemscreensedit*)item;
            NSInteger current = edititem.titles.count;
            
            if(current < shouldhave)
            {
                while(current < shouldhave)
                {
                    madditemscreensedittitle *newtitle = [[madditemscreensedittitle alloc] init];
                    [edititem.titles addObject:newtitle];
                    current++;
                }
            }
            else if(current > shouldhave)
            {
                NSRange range = NSMakeRange(shouldhave, current - shouldhave);
                [edititem.titles removeObjectsInRange:range];
            }
        }
    }
}

@end