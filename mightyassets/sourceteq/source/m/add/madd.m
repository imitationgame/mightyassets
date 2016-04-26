#import "madd.h"
#import "maddsectionproject.h"
#import "maddsectioncolors.h"
#import "maddsectionposition.h"
#import "maddsectionscreens.h"
#import "maddprocessassetiphone6.h"

@implementation madd

-(instancetype)init
{
    self = [super init];
    
    self.asset = [[maddprocessasset alloc] init];
    maddsectionproject *modelproject = [[maddsectionproject alloc] init];
    maddsectionscreens *modelscreens = [[maddsectionscreens alloc] init:modelproject];
    
    self.sections = @[
                      modelproject,
                      [[maddsectioncolors alloc] init],
                      [[maddsectionposition alloc] init],
                      modelscreens
                      ];
    
    return self;
}

#pragma mark public

-(void)registercells:(UICollectionView*)collection
{
    for(maddsection *section in self.sections)
    {
        for(madditem *item in section.items)
        {
            Class cellclass = item.cellclass;
            NSString *cellclassname = item.cellclassname;
           
            [collection registerClass:cellclass forCellWithReuseIdentifier:cellclassname];
        }
    }
}

@end