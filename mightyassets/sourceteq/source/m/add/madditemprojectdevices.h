#import <Foundation/Foundation.h>
#import "madditem.h"
#import "madditemprojectdevicesitem.h"

@interface madditemprojectdevices:madditem

-(NSArray<NSString*>*)titles;
-(madditemprojectdevicesitem*)itemselected;

@property(strong, nonatomic)NSArray<madditemprojectdevicesitem*> *items;
@property(assign, nonatomic)NSInteger selected;

@end