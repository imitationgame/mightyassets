#import "vaddcellposition.h"
#import "vaddcellpositioncell.h"
#import "madditemposition.h"

static NSString* const positioncellid = @"positioncell";

@interface vaddcellposition ()

@property(weak, nonatomic)madditemposition *model;

@end

@implementation vaddcellposition

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemposition*)model
{
    
    [super config:model];
}

#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    
}

@end