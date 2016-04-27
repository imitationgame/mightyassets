#import "maddprocess.h"
#import "madditemscreensedit.h"
#import "maddprocessdeviceiphone4.h"
#import "maddprocessdrawable.h"
#import "tools.h"
#import "cmain.h"

static CGFloat const percentdivider = 100.0;
static NSInteger const maxpercent = 100;

@implementation maddprocess

-(instancetype)init:(madd*)model
{
    self = [super init];
    self.model = model;
    self.colorbackground = model.modelcolors.modelbackground.color;
    self.colordevice = model.modelcolors.modeldevice.color;
    self.colortext = model.modelcolors.modeltext.color;
    
    madditemscreensedit *screen = (madditemscreensedit*)(model.modelscreens.items[0]);
    madditempositionitem *position = [model.modelposition.modeliphoneportrait itemselected];
    maddprocessdeviceiphone4 *device = [[maddprocessdeviceiphone4 alloc] init:position];
    
    [self drawasset:screen device:device];
    
    return self;
}

#pragma mark functionality

-(void)drawasset:(madditemscreensedit*)screen device:(maddprocessdevice*)device
{
    maddprocessasset *asset = self.model.asset;
    madditempositionitem *position = device.position;
    CGFloat percenttop = position.percenttop;
    CGFloat percentbottom = position.percentbottom;
    CGFloat assetwidth = device.orientation.width;
    CGFloat assetheight = device.orientation.height;
    CGFloat devicerawwidth = asset.imagewidth;
    CGFloat devicerawheight = asset.imageheight;
    CGFloat percenttouseheight = maxpercent - (percenttop + percentbottom);
    CGFloat percenttouseheightfloat = percenttouseheight / percentdivider;
    CGFloat usableheight = percenttouseheightfloat * assetheight;
    CGFloat margintopfloat = percenttop / percentdivider;
    CGFloat usablemargintop = margintopfloat * assetheight;
    CGFloat extrudetop = [position extrudetop:asset];
    CGFloat ratio = devicerawheight / usableheight;
    
    if(ratio < 1)
    {
        ratio = 1;
    }
    
    CGFloat usableextrudetop = extrudetop / ratio;
    CGFloat drawdevicey = usablemargintop + usableextrudetop;
    CGFloat drawdevicewidth = devicerawwidth / ratio;
    CGFloat drawdevicex = (assetwidth - drawdevicewidth) / 2.0;
    CGFloat drawdeviceheight = usableheight;
    CGRect rectdevice = CGRectMake(drawdevicex, drawdevicey, drawdevicewidth, drawdeviceheight);
    UIImage *imagedevice = [UIImage imageNamed:asset.assetname];
    
    NSString *string = @"hello world";
    UIFont *font = [UIFont fontWithName:@"ArialMT" size:device.fontsize];
    NSDictionary *textattributes = @{NSForegroundColorAttributeName:self.colortext, NSFontAttributeName:font};
    CGSize textsize = [string sizeWithAttributes:textattributes];
    CGFloat textwidth = ceilf(textsize.width);
    CGFloat textheight = ceilf(textsize.height);
    CGFloat width_text = assetwidth - textwidth;
    CGFloat height_text = drawdevicey - textheight;
    CGFloat textx = width_text / 2.0;
    CGFloat texty = height_text / 2.0;
    CGRect textrect = CGRectMake(textx, texty, textwidth, textheight);
    CGRect rectasset = CGRectMake(0, 0, assetwidth, assetheight);
    
    UIImage *newasset = [self createimage:imagedevice rect:rectasset rectdevice:rectdevice string:string stringrect:textrect attributes:textattributes];
    
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"myimage.png"];
    NSURL *url = [NSURL fileURLWithPath:filepath];
    [UIImagePNGRepresentation(newasset) writeToURL:url options:NSDataWritingAtomic error:nil];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
                       
                       if([UIPopoverPresentationController class])
                       {
                           act.popoverPresentationController.sourceView = [cmain singleton].view;
                           act.popoverPresentationController.sourceRect = CGRectMake(([cmain singleton].view.bounds.size.width / 2.0) - 2, [cmain singleton].view.bounds.size.height - 100, 1, 1);
                           act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
                       }
                       
                       [[cmain singleton] presentViewController:act animated:YES completion:
                        ^
                        {
                            [[cmain singleton].pages page_landing:UIPageViewControllerNavigationDirectionReverse animated:YES];
                        }];
                   });
}

-(UIImage*)createimage:(UIImage*)imagedevice rect:(CGRect)rect rectdevice:(CGRect)rectdevice string:(NSString*)string stringrect:(CGRect)stringrect attributes:(NSDictionary*)attributes
{
    UIImage *image;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    [imagedevice drawInRect:rectdevice];
    
    CGContextSetFillColorWithColor(context, self.colordevice.CGColor);
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextFillRect(context, rectdevice);
    CGContextSetBlendMode(context, kCGBlendModeDestinationOver);
    CGContextSetFillColorWithColor(context, self.colorbackground.CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    [string drawInRect:stringrect withAttributes:attributes];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end