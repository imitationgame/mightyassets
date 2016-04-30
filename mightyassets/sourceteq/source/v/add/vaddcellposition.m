#import "vaddcellposition.h"
#import "vaddcellpositioncell.h"
#import "madditemposition.h"
#import "uifont+uifontmain.h"

static NSString* const positioncellid = @"positioncell";
static NSInteger const cellwidth = 120;
static NSInteger const interitem = 0;

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
    [flow setMinimumLineSpacing:interitem];
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
    [collection registerClass:[vaddcellpositioncell class] forCellWithReuseIdentifier:positioncellid];
    self.collection = collection;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont regularsize:16]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:NSLocalizedString(@"madd_item_position_title", nil)];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    
    [self addSubview:label];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[label(20)]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)config:(madditemposition*)model topcollection:(UICollectionView*)topcollection
{
    [super config:model topcollection:topcollection];
    [self.collection reloadData];
    [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForRow:model.selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    NSInteger cells = self.model.items.count;
    CGFloat width_items = width - ((cells - 1) * interitem);
    CGFloat totalwidth = cellwidth * cells;
    CGFloat remain = width_items - totalwidth;
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

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger selected = index.item;
    self.model.selected = selected;
}

@end