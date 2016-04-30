#import "maddprocess.h"
#import "madditemscreensedit.h"
#import "maddprocessdeviceiphone4.h"
#import "maddprocessdrawable.h"
#import "tools.h"
#import "cmain.h"

static NSString* const imagename = @"%@_%@_%@.png";
static CGFloat const percentdivider = 100.0;
static NSInteger const maxpercent = 100;
static NSInteger const margintext = 60;

@implementation maddprocess

-(instancetype)init:(madd*)model
{
    self = [super init];
    self.model = model;
    [model.modelscreens clean];
    
    self.project = [mproject newproject:model.modelproject.modelname.name];
    self.colorbackground = model.modelcolors.modelbackground.color;
    self.colordevice = model.modelcolors.modeldevice.color;
    self.colortext = model.modelcolors.modeltext.color;
    self.position = [model.modelposition.modelposition itemselected];
    
    madditemorientationitem *orientation = [model.modelposition.modelorientation itemselected];
    maddprocessasset *asset = [[model.modelposition.modelframe itemselected] modelasset];
    self.asset = [orientation assetoriented:asset];
    
    NSArray<maddprocessdevice*> *devices = [[model.modelproject.modeldevices itemselected] devices:self.position];
    NSArray<madditemscreensedit*> *screens = [model.modelscreens screens];
    
    NSUInteger countdevices = devices.count;
    
    for(NSUInteger indexdevice = 0; indexdevice < countdevices; indexdevice++)
    {
        maddprocessdevice *device = devices[indexdevice];
        [self drawdevice:device screens:screens];
    }
    
    return self;
}

#pragma mark functionality

-(NSString*)nameforimage:(NSString*)device localization:(NSInteger)localization screen:(NSInteger)screen
{
    NSInteger indexlocalization = localization + 1;
    NSInteger indexscreen = screen + 1;
    NSString *name = [NSString stringWithFormat:imagename, device, @(indexlocalization), @(indexscreen)];
    
    return name;
}

-(void)drawdevice:(maddprocessdevice*)device screens:(NSArray<madditemscreensedit*>*)screens
{
    UIFont *font = [UIFont fontWithName:self.model.modeltitles.modelfont.font.font size:device.fontsize];
    CGFloat percenttop = self.position.percenttop;
    CGFloat percentbottom = self.position.percentbottom;
    CGFloat assetwidth = device.orientation.width;
    CGFloat assetheight = device.orientation.height;
    CGFloat devicerawwidth = self.asset.imagewidth;
    CGFloat devicerawheight = self.asset.imageheight;
    CGFloat percenttouseheight = maxpercent - (percenttop + percentbottom);
    CGFloat percenttouseheightfloat = percenttouseheight / percentdivider;
    CGFloat usableheight = percenttouseheightfloat * assetheight;
    CGFloat margintopfloat = percenttop / percentdivider;
    CGFloat usablemargintop = margintopfloat * assetheight;
    CGFloat extrudetop = [self.position extrudetop:self.asset];
    CGFloat ratio = devicerawheight / usableheight;
    
    if(ratio < 1)
    {
        ratio = 1;
    }
    
    CGFloat usableextrudetop = extrudetop / ratio;
    CGFloat drawdevicewidth = devicerawwidth / ratio;
    CGFloat drawdevicex = (assetwidth - drawdevicewidth) / 2.0;
    CGFloat drawdeviceheight = devicerawheight / ratio;
    
    if(drawdeviceheight < usableheight)
    {
        CGFloat deltadrawdevice = usableheight - drawdeviceheight;
        usableextrudetop += deltadrawdevice;
    }
    
    CGFloat drawdevicey = usablemargintop + usableextrudetop;
    
    NSMutableParagraphStyle *textalignment = [[NSMutableParagraphStyle alloc] init];
    textalignment.alignment = NSTextAlignmentCenter;
    NSDictionary *textattributes = @{NSForegroundColorAttributeName:self.colortext, NSFontAttributeName:font, NSParagraphStyleAttributeName:textalignment};
    
    maddprocessdrawable *drawable = [[maddprocessdrawable alloc] init:assetwidth height:assetheight];
    
    if(self.asset)
    {
        drawable.device = [[maddprocessdrawabledevice alloc] init:drawdevicex y:drawdevicey width:drawdevicewidth height:drawdeviceheight];
    }
    
    NSInteger countscreens = screens.count;
    
    for(NSUInteger indexscreen = 0; indexscreen < countscreens; indexscreen++)
    {
        madditemscreensedit *screen = screens[indexscreen];
        
        if(screen.image)
        {
            CGFloat screenx = self.asset.screenx;
            CGFloat screeny = self.asset.screeny;
            CGFloat screenwidth = self.asset.screenwidth;
            CGFloat screenheight = self.asset.screenheight;
            CGFloat ratioscreenx = screenx / ratio;
            CGFloat ratioscreeny = screeny / ratio;
            CGFloat ratioscreenwidth = screenwidth / ratio;
            CGFloat ratioscreenheight = screenheight / ratio;
            CGFloat usablescreenx = ratioscreenx + drawdevicex;
            CGFloat usablescreeny = ratioscreeny + drawdevicey;
            
            drawable.screen = [[maddprocessdrawablescreen alloc] init:usablescreenx y:usablescreeny width:ratioscreenwidth height:ratioscreenheight];
            drawable.screen.image = screen.image;
        }
        
        NSUInteger counttitles = screen.titles.count;
        
        for(NSUInteger indextitle = 0; indextitle < counttitles; indextitle++)
        {
            madditemscreensedittitle *title = screen.titles[indextitle];
            
            if(title.title.length)
            {
                NSString *string = title.title;
                CGFloat textspacewidth = assetwidth - (margintext + margintext);
                CGFloat textspaceheight = drawdevicey;
                CGSize textspace = CGSizeMake(textspacewidth, textspaceheight);
                CGRect textsize = [string boundingRectWithSize:textspace options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:textattributes context:nil];
                CGFloat textwidth = ceilf(textsize.size.width);
                CGFloat textheight = ceilf(textsize.size.height);
                CGFloat width_text = textspacewidth - textwidth;
                CGFloat height_text = textspaceheight - textheight;
                CGFloat textx = (width_text / 2.0) + margintext;
                CGFloat texty = height_text / 2.0;
                
                drawable.text = [[maddprocessdrawabletext alloc] init:textx y:texty width:textwidth height:textheight];
                drawable.text.string = string;
                drawable.text.attributes = textattributes;
            }
            
            UIImage *newimage = [self createimage:drawable];
            NSString *imagename = [self nameforimage:device.name localization:indextitle screen:indexscreen];
            
            [self.project addimage:newimage name:imagename];
        }
    }
}

-(UIImage*)createimage:(maddprocessdrawable*)drawable
{
    UIImage *image;
    
    UIGraphicsBeginImageContext(drawable.rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(drawable.device)
    {
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        [self.asset.image drawInRect:drawable.device.rect];
        CGContextSetFillColorWithColor(context, self.colordevice.CGColor);
        CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
        CGContextFillRect(context, drawable.device.rect);
        
        if(self.asset.imagecam)
        {
            CGContextSetBlendMode(context, kCGBlendModeNormal);
            [self.asset.imagecam drawInRect:drawable.device.rect];
        }
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
    CGContextRelease(context);
    
    return image;
}

@end