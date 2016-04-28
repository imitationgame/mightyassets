#import "vproject.h"
#import "vprojectbar.h"
#import "vprojectcell.h"

static NSString* const projectcellid = @"projectcell";
static NSInteger const interitem = 10;
static NSInteger const maxcellwidth = 200;
static NSInteger const maxcellheight = 300;
static NSInteger const celltextheight = 100;

@implementation vproject

-(instancetype)init:(cproject*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vprojectbar *bar = [[vprojectbar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:interitem];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vprojectcell class] forCellWithReuseIdentifier:projectcellid];
    self.collection = collection;
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{@"maxcellheight":@(maxcellheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(maxcellheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(mprojectitempicsitem*)modelforitem:(NSInteger)item
{
    mprojectitempicsitem *model = self.pics.items[item];
    
    return model;
}

-(void)constraint:(mprojectitempicsitem*)model
{
    model.constraints = [mprojectitempicsitemconstraints imagewidth:model.imagewidth imageheight:model.imageheight maxwidth:maxcellwidth maxheight:maxcellheight textheight:celltextheight];
}

#pragma mark public

-(void)loadpics
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       welf.pics = [welf.controller.model pics];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.collection reloadData];
                                      });
                   });
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    mprojectitempicsitem *model = [self modelforitem:section];
    
    if(!model.constraints)
    {
        [self constraint:model];
    }
    
    UIEdgeInsets insets = UIEdgeInsetsMake(model.constraints.insetstop, 0, 0, 0);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    mprojectitempicsitem *model = [self modelforitem:index.section];
    
    if(!model.constraints)
    {
        [self constraint:model];
    }
    
    CGSize size = CGSizeMake(model.constraints.cellwidth, model.constraints.cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger count = self.pics.items.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mprojectitempicsitem *model = [self modelforitem:index.section];
    vprojectcell *cell = [col dequeueReusableCellWithReuseIdentifier:projectcellid forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end