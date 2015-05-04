#import <UIKit/UIKit.h>
#import "UAObfuscatedString.h"
#include <dlfcn.h>

bool enabled;
bool isOverlayEnabled;
bool isFullScreenView;
bool showStatusBar;
bool pirated;

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("com.greeny.classicsiri"));

    enabled = !CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.classicsiri")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.classicsiri")) boolValue];
    isOverlayEnabled = !CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.classicsiri")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.classicsiri")) boolValue];
    showStatusBar = !CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.classicsiri")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.classicsiri")) boolValue];
}

%hook AFUISiriViewController
-(void)_addStatusBar {
    if(showStatusBar){
        %orig;
    }
}

-(void)siriDidActivateFromSource:(long long)arg1 {
    %orig;
    if(!pirated && enabled && isOverlayEnabled){
		isFullScreenView = NO;

        [[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .6, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .4 )];

        UIButton *changeViewBtn = [UIButton buttonWithType: UIButtonTypeContactAdd];

        [changeViewBtn setTintColor:[UIColor grayColor]];
        [changeViewBtn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * .9, [UIScreen mainScreen].bounds.size.height * .34, 22, 22)];
        changeViewBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchUpInside];
        
       	[[self view] addSubview:changeViewBtn];
    }
}
%new(v@:)
- (void)changeViews{

	if(!isFullScreenView){
	
		[UIView beginAnimations:nil context:nil];
    	[UIView setAnimationDuration:0.5];
    	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

		[[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .0001, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .9999)];
	
		[UIView commitAnimations];

		isFullScreenView = YES;

	} else {
		[UIView beginAnimations:nil context:nil];
    	[UIView setAnimationDuration:0.5];
    	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

		[[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .6, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .4 )];

		[UIView commitAnimations];
		
		isFullScreenView = NO;
	}
}
%end

/*
%hook UIWindow
-(void)layoutSubviews {
	%orig;
	if (CGRectEqualToRect(self.frame, [[UIScreen mainScreen] bounds])) {
		CGRect newFrame = [[UIScreen mainScreen] bounds];
		newFrame.size.height = newFrame.size.height * .6;
		self.frame = newFrame;
	}
}
%end
*/

%hook SpringBoard
- (void)applicationDidFinishLaunching:(int)arg1{
    %orig;
    if(pirated){
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"memes" message:@"memes" delegate:nil cancelButtonTitle:@"memes" otherButtonTitles:nil];
        [view show];
    }
}
%end

static void something(){
	NSString *identifier = Obfuscate.forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.d.p.k.g.forward_slash.i.n.f.o.forward_slash.c.o.m.dot.g.r.e.e.n.y.dot.c.l.a.s.s.i.c.s.i.r.i.dot.l.i.s.t;
	if(![[NSFileManager defaultManager] fileExistsAtPath:identifier]){
		pirated = YES;
	}
}
%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)loadPreferences,
                                CFSTR("com.greeny.classicsiri/prefsChanged"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();
    dlopen("/System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI", RTLD_NOW);
    something();
}