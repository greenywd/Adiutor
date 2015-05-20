#import <UIKit/UIKit.h>
#import "UAObfuscatedString.h"
#import <UIKit/UIApplication.h>
#import <SpringBoard/SpringBoard.h>
#include <dlfcn.h>

@interface AFUISiriViewController : UIViewController
-(id)init;
-(void)dismissSiriRemoteViewController:(id)arg1;
@end

bool enabled;
bool isOverlayEnabled;
bool isFullScreenView;
bool fullScreenFirst;
bool siriIsActivated = NO;
bool showStatusBar;
bool showHelpButton;
bool pirated;

CGFloat heightOfSiri;
UIButton *changeViewBtn;
//UIWindow *window;
AFUISiriViewController *siriController;

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("com.greeny.adiutor"));

    enabled = !CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.adiutor")) boolValue];
    isOverlayEnabled = !CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.adiutor")) boolValue];
    showStatusBar = !CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.adiutor")) boolValue];
    fullScreenFirst = !CFPreferencesCopyAppValue(CFSTR("fullScreenFirst"), CFSTR("com.greeny.adiutor")) ? NO : [(id)CFPreferencesCopyAppValue(CFSTR("fullScreenFirst"), CFSTR("com.greeny.adiutor")) boolValue];
    heightOfSiri = !CFPreferencesCopyAppValue(CFSTR("heightOfSiri"), CFSTR("com.greeny.adiutor")) ? .5 : [(id)CFPreferencesCopyAppValue(CFSTR("heightOfSiri"), CFSTR("com.greeny.adiutor")) floatValue];
    showHelpButton = !CFPreferencesCopyAppValue(CFSTR("showHelpButton"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("showHelpButton"), CFSTR("com.greeny.adiutor")) boolValue];
}

%hook AFUISiriView
-(void)_configureHelpButton{
    if(showHelpButton){
        %orig;
    }
}
%end

%hook AFUISiriViewController

-(id)init {
    siriController = %orig;
    return siriController;
}

-(void)viewDidAppear:(BOOL)arg1{
    %orig;

    changeViewBtn = [[UIButton buttonWithType: UIButtonTypeContactAdd] retain];

    if(!pirated && enabled && isOverlayEnabled && !fullScreenFirst){
		isFullScreenView = NO;

        /*window = [[UIApplication sharedApplication] keyWindow];
        window.frame = CGRectMake(0, 0, window.frame.size.width, [[UIScreen mainScreen] bounds].size.height - 100);*/

        [[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];

	    [changeViewBtn setTintColor:[UIColor whiteColor]];
        [changeViewBtn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * .85, ([self view].bounds.size.height - 33), 22, 22)];

        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
        [[self view] addSubview:changeViewBtn];

    } else {

        if(!pirated && enabled && fullScreenFirst){
            isFullScreenView = YES;

            [[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

            [changeViewBtn setTintColor:[UIColor whiteColor]];
            [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];

            [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
            [[self view] addSubview:changeViewBtn];
        }
    }
}
-(CGRect)_statusBarFrame{
    CGRect r = %orig;

    if(!showStatusBar){
    return CGRectMake(r.origin.x + 1000, r.origin.y - 20, r.size.width, r.size.height);
    } else {
        return %orig;
    }
}

%new(v@:)
- (void)changeViews{

	if(!isFullScreenView){

		[UIView beginAnimations:nil context:nil];
    	[UIView setAnimationDuration:0.5];
    	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

		[[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	
		[UIView commitAnimations];

		isFullScreenView = YES;

        [changeViewBtn setTintColor:[UIColor whiteColor]];
        [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];

        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
        [[self view] addSubview:changeViewBtn];

	} else {

		[UIView beginAnimations:nil context:nil];
    	[UIView setAnimationDuration:0.5];
    	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

		[[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];

		[UIView commitAnimations];
		
		isFullScreenView = NO;
	   
        [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];
    }
}
%end

static void something(){
	NSString *identifier = Obfuscate.forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.d.p.k.g.forward_slash.i.n.f.o.forward_slash.c.o.m.dot.g.r.e.e.n.y.dot.a.d.i.u.t.o.r.dot.l.i.s.t;
    NSString *identifier2 = Obfuscate.forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.d.p.k.g.forward_slash.i.n.f.o.forward_slash.o.r.g.dot.t.h.e.b.i.g.b.o.s.s.dot.a.d.i.u.t.o.r.dot.l.i.s.t;

	if(![[NSFileManager defaultManager] fileExistsAtPath:identifier] && ![[NSFileManager defaultManager] fileExistsAtPath:identifier2]){
		pirated = YES;
	}
}
%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)loadPreferences,
                                CFSTR("com.greeny.adiutor/prefsChanged"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();
    dlopen("/System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI", RTLD_NOW);
    something();
}