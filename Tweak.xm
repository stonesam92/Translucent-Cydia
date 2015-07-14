#import <UIKit/UIKit.h>

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
    if ([request.URL.absoluteString rangeOfString:@"progress"].length != 0) {
        self.alpha = 0.7;
        self.superview.backgroundColor = [UIColor clearColor];
        [[UIApplication sharedApplication] _setBackgroundStyle:3];
    }
}

%end

%hook _UIWebViewScrollView
- (void)setBackgroundColor:(UIColor *)color {
    for (UIWebBrowserView *view in self.subviews) {
        if ([view isKindOfClass:%c(UIWebBrowserView)] && 
                [view._documentUrl.absoluteString rangeOfString:@"progress"].length != 0) {
            %orig([UIColor clearColor]);
            return;
        }
    }
    %orig;
}
%end
