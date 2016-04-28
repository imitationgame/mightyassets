#import "madditemprojectdevicesitemipad.h"
#import "maddprocessdeviceipad.h"
#import "maddprocessdeviceipadpro.h"

@implementation madditemprojectdevicesitemipad

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_projectdevices_ipad_title", nil)];
    
    return self;
}

#pragma mark -
#pragma mark devices

-(NSArray<maddprocessdevice*>*)devices:(madditempositionitem*)position
{
    NSArray<maddprocessdevice*> *devices = @[
                                             [[maddprocessdeviceipad alloc] init:position],
                                             [[maddprocessdeviceipadpro alloc] init:position]
                                             ];
    
    return devices;
}

@end