//I, EthanRDoesMC, officially apologize for this mashed-up reused code. I'm learning, okay? 
//I learn by taking things apart and adding to them... working with real - not example - code.
//Don't worry, I'm taking a course at the same time.

#import <UIKit/UIKit.h>


NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:
                                    [NSString stringWithFormat:@"%@/Library/Preferences/%@", NSHomeDirectory(), @"com.samstone.translucentcydiasettings.plist"]];
    NSNumber* foglog = [settings objectForKey:@"log"];
	NSNumber* foghome = [settings objectForKey:@"home"];
	NSNumber* fogall = [settings objectForKey:@"all"];

static NSString *LOG_HTML_URL = @"cydia.saurik.com/ui/ios~iphone/1.1/progress";

static NSString *LOG_HTML_URL_IPAD = @"cydia.saurik.com/ui/ios~ipad/1.1/progress";

static NSString *HOME_HTML_URL = @"cydia.saurik.com/ui/ios~iphone/1.1/home";

static NSString *HOME_HTML_URL_IPAD = @"cydia.saurik.com/ui/ios~pad/1.1/home";

@interface UIWebBrowserView : UIView
- (NSURL *)_documentUrl;
@end

@interface _UIWebViewScrollView : UIView
@end

@interface UIApplication (Private)
- (void)_setBackgroundStyle:(long long)style;
@end

%hook UIWebBrowserView

- (void)loadRequest:(NSURLRequest *)request {
    %orig;
    if ([request.URL.absoluteString rangeOfString:LOG_HTML_URL].length != 0 &&
			[foglog boolValue] == YES) 
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
	if ([request.URL.absoluteString rangeOfString:LOG_HTML_URL_IPAD].length != 0 &&
			[foglog boolValue] == YES)
			{
			[[UIApplication sharedApplication] _setBackgroundStyle:3];
			[UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }   
	if ([request.URL.absoluteString rangeOfString:HOME_HTML_URL].length != 0 &&
			[foghome boolValue] == YES) 
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
	if ([request.URL.absoluteString rangeOfString:HOME_HTML_URL_IPAD].length != 0 &&
			[foghome boolValue] == YES) 
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
	if ([fogall boolValue] == YES) 
			{
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
        [UIView animateWithDuration:0.3
                              delay:0.6
                            options:0
                         animations:^{
                             self.alpha = 0.65;
                             self.superview.backgroundColor = [UIColor clearColor];
                             }
                         completion:nil];
    }
}

%end

%hook _UIWebViewScrollView
- (void)setBackgroundColor:(UIColor *)color {
    for (UIWebBrowserView *view in self.subviews) {
        if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:LOG_HTML_URL].length != 0 &&
			[foglog boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
        if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:LOG_HTML_URL_IPAD].length != 0 &&
			[foglog boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
	    if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:HOME_HTML_URL].length != 0 &&
			[foghome boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
		if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:HOME_HTML_URL_IPAD].length != 0 &&
			[foghome boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
		if ([view isKindOfClass:%c(UIWebBrowserView)] && 
			[fogall boolValue] == YES)
			{
            %orig([UIColor clearColor]);
            return;
        }
		}
    %orig;
}
%end
