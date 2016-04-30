#import "madditemprojectdevices.h"
#import "madditemprojectdevicesitemiphone.h"
#import "madditemprojectdevicesitemipad.h"
#import "madditemprojectdevicesitemuniversal.h"
#import "vaddcellprojectdevices.h"

static NSInteger const cellheight = 56;

@implementation madditemprojectdevices

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_title", nil)];
    self.height = cellheight;
    self.selected = 0;
    self.cellclass = [vaddcellprojectdevices class];
    self.items = @[
                   [[madditemprojectdevicesitemiphone alloc] init],
                   [[madditemprojectdevicesitemipad alloc] init],
                   [[madditemprojectdevicesitemuniversal alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(NSArray<NSString*>*)titles
{
    NSMutableArray<NSString*> *array = [NSMutableArray array];
    NSUInteger count = self.items.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        madditemprojectdevicesitem *item = self.items[i];
        NSString *name = item.name;
        [array addObject:name];
    }
    
    return array;
}

-(madditemprojectdevicesitem*)itemselected
{
    madditemprojectdevicesitem *item = self.items[self.selected];
    
    return item;
}

@end