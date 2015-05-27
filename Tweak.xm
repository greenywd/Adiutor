#import "Adiutor.h"

bool enabled;
bool isOverlayEnabled;
bool isFullScreenView;
bool fullScreenFirst;
bool showStatusBar;
bool showHelpButton;
bool helpInvokesFullScreen;
bool pirated;
bool replaceHelpButtonWithFullscreenButton;
bool removeBlur;

CGFloat heightOfSiri;
CGFloat tintAlpha;
UIButton *changeViewBtn;
UIButton *backgroundHitButton;
UIImage *plusButtonImg;
UIImage *minusButtonImg;
SiriUIHelpButton *siriHelpButton;
AFUISiriViewController *siriController;
<<<<<<< ours
=======
SiriUISiriStatusView *siriStatusView;
>>>>>>> theirs
//UIWindow *window;

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("com.greeny.adiutor"));

    enabled = !CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("enabled"), CFSTR("com.greeny.adiutor")) boolValue];
    isOverlayEnabled = !CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("isOverlayEnabled"), CFSTR("com.greeny.adiutor")) boolValue];
    showStatusBar = !CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("showStatusBar"), CFSTR("com.greeny.adiutor")) boolValue];
    fullScreenFirst = !CFPreferencesCopyAppValue(CFSTR("fullScreenFirst"), CFSTR("com.greeny.adiutor")) ? NO : [(id)CFPreferencesCopyAppValue(CFSTR("fullScreenFirst"), CFSTR("com.greeny.adiutor")) boolValue];
    heightOfSiri = !CFPreferencesCopyAppValue(CFSTR("heightOfSiri"), CFSTR("com.greeny.adiutor")) ? .5 : [(id)CFPreferencesCopyAppValue(CFSTR("heightOfSiri"), CFSTR("com.greeny.adiutor")) floatValue];
    tintAlpha = !CFPreferencesCopyAppValue(CFSTR("tintAlpha"), CFSTR("com.greeny.adiutor")) ? .75 : [(id)CFPreferencesCopyAppValue(CFSTR("tintAlpha"), CFSTR("com.greeny.adiutor")) floatValue];
    showHelpButton = !CFPreferencesCopyAppValue(CFSTR("showHelpButton"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("showHelpButton"), CFSTR("com.greeny.adiutor")) boolValue];
    helpInvokesFullScreen = !CFPreferencesCopyAppValue(CFSTR("helpInvokesFullScreen"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("helpInvokesFullScreen"), CFSTR("com.greeny.adiutor")) boolValue];
    replaceHelpButtonWithFullscreenButton = !CFPreferencesCopyAppValue(CFSTR("replaceHelpButtonWithFullscreenButton"), CFSTR("com.greeny.adiutor")) ? YES : [(id)CFPreferencesCopyAppValue(CFSTR("replaceHelpButtonWithFullscreenButton"), CFSTR("com.greeny.adiutor")) boolValue];
    removeBlur = !CFPreferencesCopyAppValue(CFSTR("removeBlur"), CFSTR("com.greeny.adiutor")) ? NO : [(id)CFPreferencesCopyAppValue(CFSTR("removeBlur"), CFSTR("com.greeny.adiutor")) boolValue];
}

%hook AFUISiriView
-(void)_configureHelpButton{
    if(!pirated && !showHelpButton){
<<<<<<< ours
        %orig;
        siriHelpButton = MSHookIvar<SiriUIHelpButton*>(self, "_helpButton");
        [siriHelpButton removeFromSuperview];
    } else {
=======
>>>>>>> theirs
        %orig;
        siriHelpButton = MSHookIvar<SiriUIHelpButton*>(self, "_helpButton");
        [siriHelpButton removeFromSuperview];
    } else {
        %orig;
    }
}
-(id)dimBackdropSettings {
    if(removeBlur){
    _UIBackdropViewSettings *siriBlurSettings = [_UIBackdropViewSettings settingsForStyle:2030 graphicsQuality:10];
    [siriBlurSettings setGrayscaleTintAlpha:tintAlpha];
    return siriBlurSettings;
    } else {
        return %orig;
    }
}
<<<<<<< ours
-(id)dimBackdropSettings {
    if(removeBlur){
    _UIBackdropViewSettings *siriBlurSettings = [_UIBackdropViewSettings settingsForStyle:2030 graphicsQuality:10];
    [siriBlurSettings setGrayscaleTintAlpha:tintAlpha];
    return siriBlurSettings;
    } else {
        return %orig;
    }
}
-(void)loadView{
    %orig;
    backgroundHitButton = [[UIButton buttonWithType: UIButtonTypeCustom] retain];
    [backgroundHitButton addTarget:self action:@selector(dismissSiri) forControlEvents:UIControlEventTouchDown];
    [backgroundHitButton setTitle:@"" forState:UIControlStateNormal];
    [backgroundHitButton setFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [[self view] addSubview:backgroundHitButton];
}
%new(v@:)
- (void)dismissSiri{
    NSLog(@"BATMAN DISMISS");
    //[siriController siriDidDeactivate];
}
%end

%hook AFUISiriViewController
-(CGRect)_statusBarFrame{
    CGRect r = %orig;

    if(!showStatusBar && !pirated){
    return CGRectMake(r.origin.x + 1000, r.origin.y - 20, r.size.width, r.size.height);
    } else {
        return %orig;
    }
}
=======
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x > self.frame.size.width + self.frame.origin.x || point.x < self.frame.origin.x  || point.y > self.frame.size.height + self.frame.origin.y - siriStatusView.frame.size.height || point.y < self.frame.origin.y) {
        //outside, do something
        HBLogInfo(@"AFUISiriView MEMES!!!!");
    }
    return %orig;
}
%end

%hook SiriUISiriStatusView
-(id)init {
    siriStatusView = %orig;
    return siriStatusView;
}
-(void)dealloc {
    siriStatusView = nil;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (point.x > self.frame.size.width + self.frame.origin.x || point.x < self.frame.origin.x  || point.y > self.frame.size.height + self.frame.origin.y || point.y < self.frame.origin.y) {
        //outside, do something
        HBLogInfo(@"SiriUISiriStatusView MEMES!!!!");
    }
    return %orig;
}
%end

%hook AFUISiriViewController
-(CGRect)_statusBarFrame{
    CGRect r = %orig;

    if(!showStatusBar && !pirated){
    return CGRectMake(r.origin.x + 1000, r.origin.y - 20, r.size.width, r.size.height);
    } else {
        return %orig;
    }
}
>>>>>>> theirs
//pls
-(void)viewDidAppear:(BOOL)arg1{
    %orig;

    plusButtonImg = [[UIImage imageNamed:PLUS_BUTTON_IMAGE] retain];
    minusButtonImg = [[UIImage imageNamed:MINUS_BUTTON_IMAGE] retain];
    changeViewBtn = [[UIButton buttonWithType: UIButtonTypeCustom] retain];

    if(!pirated && enabled && isOverlayEnabled && !fullScreenFirst){
		isFullScreenView = NO;

        /*window = [[UIApplication sharedApplication] keyWindow];
        window.frame = CGRectMake(0, 0, window.frame.size.width, [[UIScreen mainScreen] bounds].size.height - 100);*/

        [[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];

        if(!replaceHelpButtonWithFullscreenButton){
        [changeViewBtn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * .85, ([self view].bounds.size.height - 33), 22, 22)];
        [changeViewBtn setBackgroundImage:plusButtonImg forState:UIControlStateNormal];

        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
        [[self view] addSubview:changeViewBtn];
        }
    } else {

        if(!pirated && enabled && fullScreenFirst){
            isFullScreenView = YES;

            [[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];

            [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];

            [changeViewBtn setBackgroundImage:minusButtonImg forState:UIControlStateNormal];

            [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
            [[self view] addSubview:changeViewBtn];
        }
    }
}
-(void)siriViewDidReceiveHelpAction:(id)arg1{
    if(!pirated && enabled && helpInvokesFullScreen && !replaceHelpButtonWithFullscreenButton){
        %orig;
        [[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        isFullScreenView = YES;
        [changeViewBtn setTintColor:[UIColor whiteColor]];
        [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];
        [changeViewBtn setBackgroundImage:minusButtonImg forState:UIControlStateNormal];
        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
    }
    if(!pirated && enabled && replaceHelpButtonWithFullscreenButton){
        if(!isFullScreenView){

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        [[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
        [UIView commitAnimations];

        isFullScreenView = YES;

    } else {

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        [[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];

        [UIView commitAnimations];
        
        isFullScreenView = NO;
       
        }
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
        [changeViewBtn setBackgroundImage:minusButtonImg forState:UIControlStateNormal];

        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        
        [[self view] addSubview:changeViewBtn];

	} else {

		[UIView beginAnimations:nil context:nil];
    	[UIView setAnimationDuration:0.5];
    	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

		[[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];

        [changeViewBtn setBackgroundImage:plusButtonImg forState:UIControlStateNormal];

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