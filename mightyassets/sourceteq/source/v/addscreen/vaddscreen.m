#import "vaddscreen.h"
#import "vaddscreenbar.h"
#import "vaddscreenfooter.h"
#import "vaddscreencell.h"

static NSString* const screencellid = @"screencell";
static NSString* const screenfooterid = @"screenfooter";
static NSInteger const footerheight = 350;
static NSInteger const cellheight = 70;
static NSInteger const interitem = -1;

@implementation vaddscreen

-(instancetype)init:(caddscreen*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    NSInteger current = controller.model.titles.count;
    NSInteger shouldhave = controller.model.model.modelproject.languages.quantity;
    
    if(current < shouldhave)
    {
        while(current < shouldhave)
        {
            madditemscreensedittitle *newtitle = [[madditemscreensedittitle alloc] init];
            [controller.model.titles addObject:newtitle];
            current++;
        }
    }
    else if(current > shouldhave)
    {
        while(current > shouldhave)
        {
            [controller.model.titles removeObjectAtIndex:current - 1];
            current--;
        }
    }
    
    vaddscreenbar *bar = [[vaddscreenbar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:interitem];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vaddscreenfooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:screenfooterid];
    [collection registerClass:[vaddscreencell class] forCellWithReuseIdentifier:screencellid];
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(madditemscreensedittitle*)modelforindex:(NSIndexPath*)index
{
    madditemscreensedittitle *model = self.controller.model.titles[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForFooterInSection:(NSInteger)section
{
    NSInteger width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, footerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.controller.model.titles.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vaddscreenfooter *footer = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:screenfooterid forIndexPath:index];
    
    return footer;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    madditemscreensedittitle *model = [self modelforindex:index];
    vaddscreencell *cell = [col dequeueReusableCellWithReuseIdentifier:screencellid forIndexPath:index];
    [cell config:index.item model:model];
    
    return cell;
}

@end