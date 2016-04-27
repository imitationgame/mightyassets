#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = [NSString stringWithFormat:
             @"CREATE TABLE project "
             "(id INTEGER PRIMARY KEY, created INTEGER, name TEXT COLLAGE NOCASE);"];
    
    [dbcon query:query];
    [dbcon commit];
}

@end