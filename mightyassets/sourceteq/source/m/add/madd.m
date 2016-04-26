#import "madd.h"
#import "maddprocessassetiphone6.h"

@implementation madd

-(instancetype)init
{
    self = [super init];
    
    self.asset = [[maddprocessasset alloc] init];
    maddsectionproject *modelproject = [[maddsectionproject alloc] init];
    self.modelproject = modelproject;
    
    maddsectioncolors *modelcolors = [[maddsectioncolors alloc] init];
    self.modelcolors = modelcolors;
    
    maddsectionposition *modelposition = [[maddsectionposition alloc] init];
    self.modelposition = modelposition;
    
    maddsectionscreens *modelscreens = [[maddsectionscreens alloc] init:modelproject];
    self.modelscreens = modelscreens;
    
    self.sections = @[
                      modelproject,
                      modelcolors,
                      modelposition,
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