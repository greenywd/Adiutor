@class UIStatusBar;

typedef enum {
	UIBackgroundStyleDefault,
	UIBackgroundStyleTransparent,
	UIBackgroundStyleLightBlur,
	UIBackgroundStyleDarkBlur,
	UIBackgroundStyleDarkTranslucent
} UIBackgroundStyle;

@interface UIApplication (Private)

@property (nonatomic, retain) UIStatusBar *statusBar;

+ (id)sharedApplication;
- (void)_setBackgroundStyle:(UIBackgroundStyle)backgroundStyle;
- (void)quitTopApplication:(id)arg1;
- (BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
- (id)displayIdentifier;

- (void)_beginShowingNetworkActivityIndicator;
- (void)_hideNetworkActivityIndicator;
- (void)_endShowingNetworkActivityIndicator;

@end
