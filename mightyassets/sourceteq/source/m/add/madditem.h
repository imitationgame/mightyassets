#import <Foundation/Foundation.h>

@interface madditem:NSObject

-(instancetype)init:(NSString*)title;
-(void)selectedaction;

@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *cellclassname;
@property(assign, nonatomic)NSInteger height;
@property(assign, nonatomic)BOOL selectable;
@property(assign, nonatomic)Class cellclass;

@end