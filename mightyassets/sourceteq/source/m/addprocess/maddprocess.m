#import "maddprocess.h"
#import "madditemscreensedit.h"
#import "maddprocessdevice.h"

@implementation maddprocess

-(instancetype)init:(madd*)model
{
    self = [super init];
    self.model = model;
    self.colorbackground = model.modelcolors.modelbackground.color;
    self.colordevice = model.modelcolors.modeldevice.color;
    self.colortext = model.modelcolors.modeltext.color;
    
    return self;
}

#pragma mark functionality

-(void)drawasset:(madditemscreensedit*)screen device:(maddprocessdevice*)device
{
    NSInteger assetwidth = device.orientation.width;
    NSInteger assetheight = device.orientation.height;
    
    CGSize assetsize = CGSizeMake(assetwidth, assetheight);
    CGRect assetrect = CGRectMake(0, 0, assetwidth, assetheight);
    UIGraphicsBeginImageContext(assetsize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.colorbackground.CGColor);
    CGContextAddRect(context, assetrect);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *newasset = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
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