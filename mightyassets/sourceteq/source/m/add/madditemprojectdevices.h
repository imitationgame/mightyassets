#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemprojectdevicesitem.h"

@interface madditemprojectdevices:madditem

-(NSArray<NSString*>*)titles;

@property(strong, nonatomic)NSArray<madditemprojectdevicesitem*> *items;

@end