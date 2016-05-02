#import "tools.h"
#import "cmain.h"

static NSString* const shareurl = @"https://itunes.apple.com/us/app/cdmx/id%@";
static NSString* const rateurl = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@";
static NSUInteger const dayseconds = 86400;
static NSUInteger const hourseconds = 3600;
static NSUInteger const minuteseconds = 60;

@implementation tools
{
    NSNumberFormatter *numformatter;
    CFStringRef stringref;
}

+(instancetype)singleton
{
    static tools *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSString *string = [NSString stringWithFormat:rateurl, [properties valueForKey:@"appid"]];
    NSURL *url = [NSURL URLWithString:string];
                        
    [[UIApplication sharedApplication] openURL:url];
}

+(void)shareapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSString *string = [NSString stringWithFormat:shareurl, [properties valueForKey:@"appid"]];
    NSURL *url = [NSURL URLWithString:string];
    
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = [cmain singleton].view;
        act.popoverPresentationController.sourceRect = CGRectMake(([cmain singleton].view.bounds.size.width / 2.0) - 2, [cmain singleton].view.bounds.size.height - 100, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

+(NSDictionary*)defaultdict
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
    
    return dictionary;
}

+(UIImage*)qrcode:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciimage = filter.outputImage;
    CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
    CFRelease(cgimage);
    
    return uiimage;
}

+(NSString*)cleanlatin:(NSString*)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
    str = [str stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
    str = [str stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
    str = [str stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
    str = [str stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
    str = [str stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
    str = [str stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
    str = [str stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
    return str;
}

+(NSString*)elapsedtimefrom:(NSUInteger)timestamp
{
    NSString *string;
    NSUInteger currenttime = [NSDate date].timeIntervalSince1970;
    NSUInteger elapsedtime = currenttime - timestamp;
    NSUInteger days = elapsedtime / dayseconds;
    
    if(days)
    {
        NSString *locstring;
        
        if(days == 1)
        {
            locstring = @"elapsedtime_day";
        }
        else
        {
            locstring = @"elapsedtime_days";
        }
        
        string = [NSString stringWithFormat:NSLocalizedString(locstring, nil), @(days)];
    }
    else
    {
        NSUInteger hours = (elapsedtime % dayseconds) / hourseconds;
        
        if(hours)
        {
            NSString *locstring;
            
            if(hours == 1)
            {
                locstring = @"elapsedtime_hour";
            }
            else
            {
                locstring = @"elapsedtime_hours";
            }
            
            string = [NSString stringWithFormat:NSLocalizedString(locstring, nil), @(hours)];
        }
        else
        {
            NSUInteger minutes = (elapsedtime % hourseconds) / minuteseconds;
            
            NSString *locstring;
            
            if(minutes == 1)
            {
                locstring = @"elapsedtime_minute";
            }
            else
            {
                locstring = @"elapsedtime_minutes";
            }
            
            string = [NSString stringWithFormat:NSLocalizedString(locstring, nil), @(minutes)];
        }
    }
    
    return string;
}

+(UIImage*)bufferimage:(UIImage*)image
{
    CGImageRef cgimage = image.CGImage;
    NSInteger width = CGImageGetWidth(cgimage);
    NSInteger height = CGImageGetHeight(cgimage);
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    CGImageRef newcgimage = CGBitmapContextCreateImage(context);
    UIGraphicsEndImageContext();
    UIImage *bufferedimage = [UIImage imageWithCGImage:newcgimage scale:1 orientation:image.imageOrientation];
    CGImageRelease(newcgimage);
    
    return bufferedimage;
}

-(instancetype)init
{
    self = [super init];
    
    numformatter = [[NSNumberFormatter alloc] init];
    [numformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)string
{
    NSString *newstring = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)string, nil, stringref, kCFStringEncodingUTF8);
    
    return newstring;
}

-(NSString*)numbertostring:(NSNumber*)number
{
    NSString *string = [numformatter stringFromNumber:number];
    
    return string;
}

@end