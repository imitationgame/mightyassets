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
    
    maddprocessdrawable *drawable = [[maddprocessdrawable alloc] init:assetwidth height:assetheight];
    drawable.device = [[maddprocessdrawabledevice alloc] init:drawdevicex y:drawdevicey width:drawdevicewidth height:drawdeviceheight];
    drawable.device.image = [UIImage imageNamed:asset.assetname];
    
    if(screen.image)
    {
        CGFloat screenx = asset.screenx;
        CGFloat screeny = asset.screeny;
        CGFloat screenwidth = asset.screenwidth;
        CGFloat screenheight = asset.screenheight;
        CGFloat ratioscreenx = screenx / ratio;
        CGFloat ratioscreeny = screeny / ratio;
        CGFloat ratioscreenwidth = screenwidth / ratio;
        CGFloat ratioscreenheight = screenheight / ratio;
        
        drawable.screen = [[maddprocessdrawablescreen alloc] init:ratioscreenx y:ratioscreeny width:ratioscreenwidth height:ratioscreenheight];
        drawable.screen.image = screen.image;
    }
    
    if(screen.titles.count)
    {
        madditemscreensedittitle *title = screen.titles[0];
        
        if(title.title.length)
        {
            NSString *string = title.title;
            UIFont *font = [UIFont fontWithName:@"ArialMT" size:device.fontsize];
            NSDictionary *textattributes = @{NSForegroundColorAttributeName:self.colortext, NSFontAttributeName:font};
            CGSize textsize = [string sizeWithAttributes:textattributes];
            CGFloat textwidth = ceilf(textsize.width);
            CGFloat textheight = ceilf(textsize.height);
            CGFloat width_text = assetwidth - textwidth;
            CGFloat height_text = drawdevicey - textheight;
            CGFloat textx = width_text / 2.0;
            CGFloat texty = height_text / 2.0;

            drawable.text = [[maddprocessdrawabletext alloc] init:textx y:texty width:textwidth height:textheight];
            drawable.text.string = string;
            drawable.text.attributes = textattributes;
        }
    }
    
    UIImage *newasset = [self createimage:drawable];
    
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Xmyimage.png"];
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

-(UIImage*)createimage:(maddprocessdrawable*)drawable
{
    UIImage *image;
    
    UIGraphicsBeginImageContext(drawable.rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(drawable.device)
    {
        [drawable.device.image drawInRect:drawable.device.rect];
        CGContextSetFillColorWithColor(context, self.colordevice.CGColor);
        CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
        CGContextFillRect(context, drawable.device.rect);
    }
    
    CGContextSetBlendMode(context, kCGBlendModeDestinationOver);
    CGContextSetFillColorWithColor(context, self.colorbackground.CGColor);
    CGContextFillRect(context, drawable.rect);
    
    if(drawable.screen)
    {
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        [drawable.screen.image drawInRect:drawable.screen.rect];
    }
    
    if(drawable.text)
    {
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        [drawable.text.string drawInRect:drawable.text.rect withAttributes:drawable.text.attributes];
    }
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end