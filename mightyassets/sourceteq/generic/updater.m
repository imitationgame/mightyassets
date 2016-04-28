#import "updater.h"
#import "tools.h"
#import "msettings.h"
#import "mdb.h"
#import "db.h"
#import "analytics.h"
#import "cmain.h"
#import "mdirs.h"
#import "genericconstants.h"

@implementation updater

+(void)launch
{
    [updater update];
    [[msettings singleton] load];
    [[analytics singleton] start];
}

#pragma mark private

+(void)update
{
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSDictionary *defaults = [tools defaultdict];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version < 10)
        {
            [updater firsttime:defaults documents:documents];
            [mdb updatedb:documents];
        }
    }
    
    dbname = [documents stringByAppendingPathComponent:[properties valueForKey:@"dbname"]];
}

+(void)firsttime:(NSDictionary*)plist documents:(NSString*)documents
{
    NSNumber *appid = plist[@"appid"];
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:@"appid"];
    [userdef synchronize];
    
    NSString *projects = [documents stringByAppendingPathComponent:folderprojects];
    [mdirs createdir:[NSURL fileURLWithPath:projects]];
}

@end