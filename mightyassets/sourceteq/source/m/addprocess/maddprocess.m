#import "maddprocess.h"
#import "madditemscreensedit.h"
#import "maddprocessdeviceiphone4.h"
#import "tools.h"
#import "cmain.h"

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
    CGFloat devicerawwidth = self.model.asset.imagewidth;
    CGFloat devicerawheight = self.model.asset.imageheight;
    CGFloat percenttouseheight = 100 - (device.position.percenttop - device.position.percentbottom);
    CGFloat percenttouseheightfloat = percenttouseheight / 100.0;
    CGFloat usablewidth = device.orientation.width;
    CGFloat usableheight = percenttouseheightfloat * device.orientation.height;
    CGFloat margintopfloat = device.position.percenttop / 100.0;
    CGFloat usablemargintop = margintopfloat * device.orientation.height;
    CGFloat extrudetop = [device.position extrudetop:self.model.asset];
    CGFloat ratio = devicerawheight / usableheight;
    CGFloat usableextrudetop = extrudetop / ratio;
    CGFloat drawdevicex = 0;
    CGFloat drawdevicey = usablemargintop + usableextrudetop;
    CGFloat drawdevicewidth = devicerawwidth;
    CGFloat drawdeviceheight = usableheight;
    
    if(ratio > 1)
    {
        drawdevicewidth /= ratio;
    }
    
    CGRect rectdevice = CGRectMake(drawdevicex, drawdevicey, drawdevicewidth, drawdeviceheight);
    UIImage *imagedevice = [UIImage imageNamed:self.model.asset.assetname];
    
    NSInteger assetwidth = device.orientation.width;
    NSInteger assetheight = device.orientation.height;
    
    CGSize assetsize = CGSizeMake(assetwidth, assetheight);
    CGRect assetrect = CGRectMake(0, 0, assetwidth, assetheight);
    UIGraphicsBeginImageContextWithOptions(assetsize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, self.colorbackground.CGColor);
//    CGContextAddRect(context, assetrect);
//    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rectdevice, imagedevice.CGImage);
    
    CGContextSetFillColorWithColor(context, self.colordevice.CGColor);
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextFillRect(context, rectdevice);
    
    CGContextSetBlendMode(context, kCGBlendModeDestinationOver);
    CGContextSetFillColorWithColor(context, self.colorbackground.CGColor);
    CGContextFillRect(context, assetrect);
    
    UIImage *newasset = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"myimage.png"];
    NSURL *url = [NSURL fileURLWithPath:filepath];
    [UIImagePNGRepresentation(newasset) writeToURL:url options:NSDataWritingAtomic error:nil];
    
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
    
    /*
    
    
    UIImage *bottomImage = [UIImage imageNamed:@"bottom.png"]; //background image
    UIImage *image       = [UIImage imageNamed:@"top.png"]; //foreground image
    
    CGSize newSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Apply supplied opacity if applicable
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:0.8];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();*/
}

@end