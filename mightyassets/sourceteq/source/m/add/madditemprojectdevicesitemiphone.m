#import "madditemprojectdevicesitemiphone.h"
#import "maddprocessdeviceiphone4.h"
#import "maddprocessdeviceiphone5.h"
#import "maddprocessdeviceiphone6.h"
#import "maddprocessdeviceiphone6plus.h"

@implementation madditemprojectdevicesitemiphone

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_iphone_title", nil)];
    
    return self;
}

#pragma mark -
#pragma mark devices

-(NSArray<maddprocessdevice*>*)devices:(madditempositionitem*)position
{
    NSArray<maddprocessdevice*> *devices = @[
                                             [[maddprocessdeviceiphone4 alloc] init:position],
                                             [[maddprocessdeviceiphone5 alloc] init:position],
                                             [[maddprocessdeviceiphone6 alloc] init:position],
                                             [[maddprocessdeviceiphone6plus alloc] init:position]
                                             ];
    
    return devices;
}

@end