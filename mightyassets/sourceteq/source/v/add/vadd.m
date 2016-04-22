#import "vadd.h"
#import "vaddbar.h"
#import "vaddheader.h"
#import "vaddfooter.h"
#import "vaddcell.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

static NSString* const addheaderid = @"addheader";
static NSString* const addfooterid = @"addfooter";
static NSString* const addcellid = @"addcell";
static NSInteger const interitem = 1;
static NSInteger const headerheight = 40;
static NSInteger const footerheight = 40;

@implementation vadd

-(instancetype)init:(cadd*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor background]];
    self.controller = controller;
    self.model = [[madd alloc] init];
    
    vaddbar *bar = [[vaddbar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setMinimumLineSpacing:interitem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
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
    [collection registerClass:[vaddfooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:addfooterid];
    [collection registerClass:[vaddcell class] forCellWithReuseIdentifier:addcellid];
    
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

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForFooterInSection:(NSInteger)section
{
    NSInteger width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, footerheight);
    
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
    UICollectionReusableView *reusable;
    
    if(kind == UICollectionElementKindSectionHeader)
    {
        maddsection *model = self.model.sections[index.section];
        vaddheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:addheaderid forIndexPath:index];
        [header config:model];
        
        reusable = header;
    }
    else
    {
        vaddfooter *footer = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:addfooterid forIndexPath:index];
        reusable = footer;
    }
    
    return reusable;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vaddcell *cell = [col dequeueReusableCellWithReuseIdentifier:addcellid forIndexPath:index];
    
    return cell;
}

@end