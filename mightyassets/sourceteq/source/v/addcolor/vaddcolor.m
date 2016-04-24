#import "vaddcolor.h"
#import "vaddcolorcell.h"

static NSString* const colorcellid = @"colorcell";
static NSInteger const colbottom = 40;
static NSInteger const cellsize = 100;
static NSInteger const minmargin = 30;

@implementation vaddcolor

-(instancetype)init:(caddcolor*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vaddcolorbar *bar = [[vaddcolorbar alloc] init:controller];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(maddcoloritem*)modelforindex:(NSIndexPath*)index
{
    maddcoloritem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark public

-(void)viewappear
{
    self.model = [[maddcolor alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(cellsize, cellsize)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
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
    [collection registerClass:[vaddcolorcell class] forCellWithReuseIdentifier:colorcellid];
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    NSInteger width = col.bounds.size.width;
    NSInteger width_margin = width - (minmargin + minmargin);
    NSInteger maxcells = width_margin / cellsize;
    NSInteger cellswidth = cellsize * maxcells;
    CGFloat remain = width - cellswidth;
    CGFloat margin = remain / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, colbottom, margin);
    
    return insets;
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
    maddcoloritem *model = [self modelforindex:index];
    vaddcolorcell *cell = [col dequeueReusableCellWithReuseIdentifier:colorcellid forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    maddcoloritem *model = [self modelforindex:index];
    [self.controller changecolor:model.color];
}

@end