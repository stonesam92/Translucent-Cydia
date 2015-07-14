#import <UIKit/UIKit.h>

static NSString *LOG_HTML_URL = @"cydia.saurik.com/ui/ios~iphone/1.1/progress";

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
    if ([request.URL.absoluteString rangeOfString:LOG_HTML_URL].length != 0) {
        self.alpha = 0.65;
        self.superview.backgroundColor = [UIColor clearColor];
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
    }
}

%end

%hook _UIWebViewScrollView
- (void)setBackgroundColor:(UIColor *)color {
    for (UIWebBrowserView *view in self.subviews) {
        if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:LOG_HTML_URL].length != 0) {
            %orig([UIColor clearColor]);
            return;
        }
    }
    %orig;
}
%end
