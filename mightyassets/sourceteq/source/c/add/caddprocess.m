#import "caddprocess.h"
#import "vaddprocess.h"
#import "cmain.h"

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
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if(!welf.process)
                       {
                           welf.process = [[maddprocess alloc] init:welf.model];
                       }
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [[cmain singleton].pages page_project:welf.process.project];
                                      });
                   });
}

-(void)loadView
{
    self.view = [[vaddprocess alloc] init:self];
}

@end