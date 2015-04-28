#define DPKG_PATH "/var/lib/dpkg/info/com.greeny.classicsiri"
#import <UIKit/UIKit.h>
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
    if(enabled && isOverlayEnabled){
        [[self view] setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height * .6, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * .4 )];
    }
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
%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)loadPreferences,
                                CFSTR("com.greeny.classicsiri/prefsChanged"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();
    dlopen("/System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI", RTLD_NOW);
    if(access(DPKG_PATH, F_OK) == - 1){
        pirated = 0;
    }
}