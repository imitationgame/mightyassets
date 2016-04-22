#import <Foundation/Foundation.h>

@interface madditem:NSObject

-(instancetype)init:(NSString*)title;
-(void)selectedaction;

@property(copy, nonatomic)NSString *title;
@property(assign, nonatomic)NSInteger height;
@property(assign, nonatomic)BOOL selectable;

@end