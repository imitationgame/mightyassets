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
        string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_days", nil), @(days)];
    }
    else
    {
        NSUInteger hours = (elapsedtime % dayseconds) / hourseconds;
        
        if(hours)
        {
            string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_hours", nil), @(hours)];
        }
        else
        {
            NSUInteger minutes = (elapsedtime % hourseconds) / minuteseconds;
            string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_minutes", nil), @(minutes)];
        }
    }
    
    return string;
}

#pragma mark -

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