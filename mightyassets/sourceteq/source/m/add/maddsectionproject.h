#import <Foundation/Foundation.h>
#import "maddsection.h"
#import "madditemprojectlanguages.h"
#import "madditemprojectdevices.h"
#import "madditemprojectname.h"

@interface maddsectionproject:maddsection

@property(weak, nonatomic)madditemprojectname *modelname;
@property(weak, nonatomic)madditemprojectlanguages *modellanguages;
@property(weak, nonatomic)madditemprojectdevices *modeldevices;

@end