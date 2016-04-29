#import "mdb.h"
#import "mdbcreate.h"
#import "db.h"
#import "tools.h"
#import "mdirs.h"

@implementation mdb

+(void)updatedb:(NSString*)documents
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSDictionary *def = [tools defaultdict];
    
    NSString *dbfoldername = @"db";
    NSString *defdbname = def[@"dbname"];
    NSString *relative = [dbfoldername stringByAppendingPathComponent:defdbname];
    NSString *dbfolder = [documents stringByAppendingPathComponent:dbfoldername];
    [userdef setValue:relative forKey:@"dbname"];
    
    NSString *originaldb = [[NSBundle mainBundle] pathForResource:defdbname ofType:@""];
    dbname = [documents stringByAppendingPathComponent:relative];
    [mdirs createdir:[NSURL fileURLWithPath:dbfolder]];
    [mdirs copyfilefrom:originaldb to:dbname];
    
    [mdbcreate create];
}

+(NSArray<NSDictionary*>*)fetchprojects
{
    NSString *query = [NSString stringWithFormat:
                       @"SELECT id, created, name FROM project "
                       "ORDER BY created DESC;"];
    NSArray<NSDictionary*> *rawprojects = [db rows:query];
    
    return rawprojects;
}

+(NSInteger)addproject:(NSString*)name created:(NSInteger)created
{
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO project (created, name) "
                       "values(%@, \"%@\");",
                       @(created), name];
    
    NSInteger projectid = [db query_identity:query];
    
    return projectid;
}

+(void)deleteproject:(NSInteger)projectid
{
    NSString *query = [NSString stringWithFormat:
                       @"DELETE FROM project where id=%@;",
                       @(projectid)];
    
    [db query:query];
}

@end