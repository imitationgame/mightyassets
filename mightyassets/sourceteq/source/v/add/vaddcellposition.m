#import "vaddcellposition.h"
#import "vaddcellpositioncell.h"
#import "madditemposition.h"

static NSString* const positioncellid = @"positioncell";
static NSInteger const cellwidth = 100;

@interface vaddcellposition ()

@property(weak, nonatomic)madditemposition *model;

@end

@implementation vaddcellposition

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:collection];
    
    return self;
}

#pragma mark functionality

-(madditempositionitem*)modelforindex:(NSIndexPath*)index
{
    madditempositionitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark add cell

-(void)config:(madditemposition*)model
{
    [super config:model];
    
    [self.collection reloadData];
}

#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    NSInteger cells = self.model.items.count;
    CGFloat totalwidth = cellwidth * cells;
    CGFloat remain = width - totalwidth;
    CGFloat margin = remain / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = col.bounds.size.height;
    CGSize size = CGSizeMake(cellwidth, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    madditempositionitem *model = [self modelforindex:index];
    vaddcellpositioncell *cell = [col dequeueReusableCellWithReuseIdentifier:positioncellid forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end