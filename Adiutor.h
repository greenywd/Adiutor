#import <UIKit/UIKit.h>
#import "UAObfuscatedString.h"
#import <UIKit/UIApplication.h>
#import <SpringBoard/SpringBoard.h>
#define PLUS_BUTTON_IMAGE @"/Library/PreferenceBundles/adiutor.bundle/booton1"
#define MINUS_BUTTON_IMAGE @"/Library/PreferenceBundles/adiutor.bundle/booton"
#define CLASSIC_BACKGROUND @"/Library/PreferenceBundles/adiutor.bundle/ClassicBackground"
#include <dlfcn.h>

@interface SiriUIContentButton : UIButton
@end

@interface SiriUIHelpButton : SiriUIContentButton
@end

@interface _UIBackdropViewSettings : NSObject
+(id)settingsForStyle:(long long)arg1 graphicsQuality:(long long)arg2 ;
-(void)setGrayscaleTintAlpha:(CGFloat)arg1;
-(CGFloat)grayscaleTintAlpha;
@end

@interface AFUISiriViewController : UIViewController
-(void)siriDidDeactivate;
-(void)viewWillDisappearFinishedForSiriRemoteViewController:(id)arg1;
@end

@interface AFUISiriView : UIView
@end

@interface SiriUISiriStatusView : UIView
@end

@interface SBIconContentView : UIView
//-(void)layoutSubviews;
-(void)iconViewForSiri:(BOOL)shouldPushScreenUp;
+(id)sharedInstance;
-(id)initWithOrientation:(CGFloat)orientation;
@end

CGFloat heightOfSiri;
CGFloat tintAlpha;
CGFloat something1;
CGRect oldCenter;
CGRect newCenter;
UIButton *changeViewBtn;
UIButton *backgroundHitButton;
UIImage *plusButtonImg;
UIImage *minusButtonImg;
UIImage *classicbck;
SiriUIHelpButton *siriHelpButton;
SiriUISiriStatusView *siriStatusView;
SBIconContentView *iconView;
AFUISiriViewController *siriVC;
id sharedInstance;
//id sharedInstanceVC;
//UIWindow *window;