#import "maddsectionscreens.h"
#import "madditemscreensedit.h"
#import "madditemscreensadd.h"

@interface maddsectionscreens ()

@property(strong, nonatomic)NSMutableArray<madditem*> *items;

@end

@implementation maddsectionscreens

@dynamic items;

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_screens_name", nil)];
    self.items = [NSMutableArray array];
    [self.items addObject:[[madditemscreensedit alloc] init:0]];
    [self.items addObject:[[madditemscreensadd alloc] init]];
    
    return self;
}


@end