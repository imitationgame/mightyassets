#import "msettings.h"
#import "genericconstants.h"

@implementation msettings

+(instancetype)singleton
{
    static msettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark functionality

#pragma mark public

-(void)load
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults valueForKey:settingskey];
    
    if(!settings)
    {
        [self save];
    }
}

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:settingskey];
}

@end