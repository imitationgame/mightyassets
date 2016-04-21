#import "vlanding.h"
#import "vlandingclearheader.h"
#import "vlandingcell.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

static NSString* const clearheaderid = @"clearheader";
static NSString* const cellid = @"cell";
static NSInteger const barheight = 200;
static NSInteger const cellheight = 80;
static NSInteger const interitem = 1;
static NSInteger const colbottom;

@implementation vlanding
{
    CGFloat barmintop;
}

-(instancetype)init:(clanding*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor background]];
    self.controller = controller;
    barmintop = -barheight + navbarheightmin;
    
    vlandingbar *bar = [[vlandingbar alloc] init:controller];
    self.bar = bar;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:interitem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, colbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vlandingclearheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:clearheaderid];
    [collection registerClass:[vlandingcell class] forCellWithReuseIdentifier:cellid];
    
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{@"barheight":@(barheight)};
    
    self.layoutbartop = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar(barheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbartop];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newbartop = -offsety;
    
    if(newbartop < barmintop)
    {
        newbartop = barmintop;
    }
    else if(newbartop > 0)
    {
        newbartop = 0;
    }
    
    self.layoutbartop.constant = newbartop;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, barheight);
    
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
    return 100;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vlandingclearheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:clearheaderid forIndexPath:index];
    [header config:self.bar.interactiveconstraints];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vlandingcell *cell = [col dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:index];
    
    return cell;
}

@end