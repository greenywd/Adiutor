#import <UIKit/UIKit.h>
#import "UAObfuscatedString.h"
#include <dlfcn.h>

bool enabled;
bool isOverlayEnabled;
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
        [[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .6, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .4 )];
        
        UIButton *fullScreen = [UIButton buttonWithType: UIButtonTypeSystem];
        [fullScreen setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * .5, [UIScreen mainScreen].bounds.size.height *.2, 100, 100)];
        //[fullScreen setUserInteraction:YES];
        [fullScreen setTitle:@"fullScreen" forState:UIControlStateNormal];
        [fullScreen addTarget:self action:@selector(presentFullScreen) forControlEvents:UIControlEventTouchUpInside];
        [[self view] addSubview:fullScreen];
    }
}
%new(v@:)
- (void)presentFullScreen{
	[[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .1, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .9)];
}
%end

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