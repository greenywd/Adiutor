#import "UIStatusBarForegroundView.h"

@interface UIStatusBar : UIView {
	UIStatusBarForegroundView *_foregroundView;
}

+ (int)defaultStatusBarStyle;

- (CGRect)currentFrame;

@end
