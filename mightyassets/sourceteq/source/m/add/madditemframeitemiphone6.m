#import "madditemframeitemiphone6.h"
#import "maddprocessassetiphone6.h"

@implementation madditemframeitemiphone6

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_item_frame_iphone6_title", nil) asset:@"add_frame_iphone6"];
    
    return self;
}

#pragma mark -
#pragma mark frame item

-(maddprocessasset*)asset
{
    maddprocessassetiphone6 *asset = [[maddprocessassetiphone6 alloc] init];
    
    return asset;
}

@end