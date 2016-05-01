#import "vaddcoloradd.h"
#import "vaddcoloraddcell.h"
#import "vaddcoloraddbar.h"

static NSString* const coloraddheaderid = @"coloraddheader";
static NSString* const coloraddcellid = @"coloraddcell";
static NSInteger const headerheight = 200;
static NSInteger const cellheight = 60;
static NSInteger const interitem = -1;

@implementation vaddcoloradd

-(instancetype)init:(caddcoloradd*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    self.model = [[maddcoloradd alloc] init];
    
    vaddcoloraddbar *bar = [[vaddcoloraddbar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:interitem];
    [flow setSectionInset:UIEdgeInsetsZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vaddcoloraddheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:coloraddheaderid];
    [collection registerClass:[vaddcoloraddcell class] forCellWithReuseIdentifier:coloraddcellid];
    self.collection = collection;
    
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"col":collection, @"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(maddcoloradditem*)modelforindex:(NSIndexPath*)index
{
    maddcoloradditem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, headerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, cellheight);
    
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

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vaddcoloraddheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:coloraddheaderid forIndexPath:index];
    [header config:self.model];
    self.header = header;
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    maddcoloradditem *model = [self modelforindex:index];
    vaddcoloraddcell *cell = [col dequeueReusableCellWithReuseIdentifier:coloraddcellid forIndexPath:index];
    [cell config:model view:self];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldHighlightItemAtIndexPath:(NSIndexPath*)index
{
    return NO;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    return NO;
}

@end