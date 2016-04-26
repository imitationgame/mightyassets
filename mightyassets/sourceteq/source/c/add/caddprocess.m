#import "caddprocess.h"
#import "vaddprocess.h"

@interface caddprocess ()

@property(strong, nonatomic)vaddprocess *view;

@end

@implementation caddprocess

@dynamic view;

-(instancetype)init:(madd*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.process = [[maddprocess alloc] init:self.model];
}

-(void)loadView
{
    self.view = [[vaddprocess alloc] init:self];
}

@end