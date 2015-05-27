#import <UIKit/UIKit.h>
#import "UAObfuscatedString.h"
#import <UIKit/UIApplication.h>
#import <SpringBoard/SpringBoard.h>
#define PLUS_BUTTON_IMAGE @"/Library/PreferenceBundles/adiutor.bundle/booton1"
#define MINUS_BUTTON_IMAGE @"/Library/PreferenceBundles/adiutor.bundle/booton"
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
-(void)endSession;
-(void)siriDidDeactivate;
-(void)_removeFromParentViewAndViewController;
@end

@interface AFUISiriView : UIView
@end

@interface SiriUISiriStatusView : UIView
@end