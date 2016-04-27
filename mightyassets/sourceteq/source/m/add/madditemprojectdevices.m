#import "madditemprojectdevices.h"
#import "madditemprojectdevicesitemiphone.h"
#import "madditemprojectdevicesitemipad.h"
#import "madditemprojectdevicesitemuniversal.h"

static NSInteger const cellheight = 80;

@implementation madditemprojectdevices

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_title", nil)];
    self.height = cellheight;
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

@end