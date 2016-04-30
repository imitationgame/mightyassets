#import "maddsectionposition.h"

@implementation maddsectionposition

@dynamic items;

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"madd_section_position_name", nil)];

    madditemframe *modelframe = [[madditemframe alloc] init];
    self.modelframe = modelframe;
    
    madditemorientation *modelorientation = [[madditemorientation alloc] init:self];
    self.modelorientation = modelorientation;
    
    madditemposition *modelposition = [[modelorientation itemselected] position];
    self.modelposition = modelposition;
    
    self.items = [NSMutableArray array];
    [self.items addObject:modelframe];
    [self.items addObject:modelorientation];
    [self.items addObject:modelposition];
    
    return self;
}

#pragma mark public

-(void)changeposition:(madditemposition*)modelposition
{
    NSInteger index = [self.items indexOfObject:self.modelposition];
    [self.items replaceObjectAtIndex:index withObject:modelposition];
    self.modelposition = modelposition;
}

@end