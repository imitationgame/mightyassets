#import "madd.h"
#import "maddsectionproject.h"
#import "maddsectioncolors.h"
#import "maddsectionposition.h"
#import "maddsectionscreens.h"

@implementation madd

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[maddsectionproject alloc] init],
                      [[maddsectioncolors alloc] init],
                      [[maddsectionposition alloc] init],
                      [[maddsectionscreens alloc] init]
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