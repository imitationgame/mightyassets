#import "vadd.h"
#import "vaddbar.h"
#import "vaddheader.h"
#import "vaddcell.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

static NSString* const addheaderid = @"addheader";
static NSInteger const headerheight = 50;
static NSInteger const colbottom = 50;
static NSInteger const interitem = -1;

@implementation vadd

-(instancetype)init:(cadd*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    self.model = [[madd alloc] init];
    
    vaddbar *bar = [[vaddbar alloc] init:self];
    
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
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vaddheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:addheaderid];
    [self.model registercells:collection];
    self.collection = collection;
    
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:navbarheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

#pragma mark functionality

-(madditem*)modelforindex:(NSIndexPath*)index
{
    NSInteger section = index.section;
    NSInteger item = index.item;
    madditem *model = self.model.sections[section].items[item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    NSInteger width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, headerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    madditem *model = [self modelforindex:index];
    NSInteger width = col.bounds.size.width;
    NSInteger height = model.height;
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.model.sections.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    maddsection *model = self.model.sections[section];
    NSInteger count = model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    maddsection *model = self.model.sections[index.section];
    vaddheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:addheaderid forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    madditem *model = [self modelforindex:index];
    vaddcell *cell = [col dequeueReusableCellWithReuseIdentifier:model.cellclassname forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldHighlightItemAtIndexPath:(NSIndexPath*)index
{
    madditem *model = [self modelforindex:index];
    BOOL highlightable = model.selectable;
    
    return highlightable;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    madditem *model = [self modelforindex:index];
    BOOL selectable = model.selectable;
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    madditem *model = [self modelforindex:index];
    [model selectedaction];
}

@end