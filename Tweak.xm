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
//yes, this actually toggles classic mode - albeit very, very unfinished.
bool useClassicMode = NO;

//load some prefs
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
//create a sharedinstance so we can call methods from this class later on
%hook SBIconContentView
-(id)initWithOrientation:(CGFloat)orientation{
    sharedInstance = self;
    return %orig;
}
%new
+(id)sharedInstance{
    return sharedInstance;
}
//new method to push the screen up (just the icons though)
%new
-(void)iconViewForSiri:(BOOL)shouldPushScreenUp{
    //yes, i know this if statement is probably very reduntant (you'll see later on)
    if(useClassicMode){
    	oldCenter = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    	newCenter = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - heightOfSiri, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    	HBLogInfo(@"newCenter = %@", NSStringFromCGRect(newCenter));
    }

    if(shouldPushScreenUp){
    	[self setFrame:newCenter];
    } else {
    	[self setFrame:oldCenter];
    }
}
%end

%hook AFUISiriView
-(void)_configureHelpButton{
    %orig;
    if(!pirated && !showHelpButton){
        //remove help button
        siriHelpButton = MSHookIvar<SiriUIHelpButton*>(self, "_helpButton");
        [siriHelpButton removeFromSuperview];
    }
}
-(id)dimBackdropSettings {
    //remove blur and change the tint
	_UIBackdropViewSettings *siriBlurSettings = [_UIBackdropViewSettings settingsForStyle:2030 graphicsQuality:10];
    
    if(removeBlur){
    	[siriBlurSettings setGrayscaleTintAlpha:tintAlpha];
    	return siriBlurSettings;
    } else if(useClassicMode){
    	[siriBlurSettings setGrayscaleTintAlpha:0];
    	return siriBlurSettings;
    } else {
        return %orig;
    }
}
%end

//pretty sure this is redundant, but i used this to create a new instance of this class
%hook SiriUISiriStatusView
-(id)init {
    siriStatusView = %orig;
    return siriStatusView;
}
-(void)dealloc {
    siriStatusView = nil;
}
%end

//this is where the magic happens
%hook AFUISiriViewController
-(void)viewDidDisappear:(BOOL)arg1{
    %orig;
    //see, probably redundant
    if(useClassicMode){
        [[%c(SBIconContentView) sharedInstance] iconViewForSiri:NO];
    }
}
//remove or show the statusbar
-(CGRect)_statusBarFrame{
    CGRect r = %orig;

    if(!showStatusBar && !pirated){
    	return CGRectMake(r.origin.x + 1000, r.origin.y - 20, r.size.width, r.size.height);
    } else {
        return %orig;
    }
}
//where most of the magic happens
-(void)viewDidAppear:(BOOL)arg1{
    %orig;

    plusButtonImg = [[UIImage imageWithContentsOfFile:PLUS_BUTTON_IMAGE] retain];
    minusButtonImg = [[UIImage imageWithContentsOfFile:MINUS_BUTTON_IMAGE] retain];
    changeViewBtn = [[UIButton buttonWithType: UIButtonTypeCustom] retain];

    //once again, redundant
    if(useClassicMode){
        [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:CLASSIC_BACKGROUND]]];

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        something1 = [self view].bounds.size.height * heightOfSiri;
        [[self view] setFrame:CGRectMake(0, something1, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];
        
        [UIView commitAnimations];
        [[objc_getClass("SBIconContentView") sharedInstance] iconViewForSiri:YES];
	}
    
    if(!pirated && enabled && isOverlayEnabled && !fullScreenFirst){
		isFullScreenView = NO;

        //this is where i attempted to push the whole screen up, but it half didn't work
        /*window = [[UIApplication sharedApplication] keyWindow];
        window.frame = CGRectMake(0, 0, window.frame.size.width, [[UIScreen mainScreen] bounds].size.height - 100);*/

        //R E D U N D A N T
        if(!useClassicMode){
        [[self view] setFrame:CGRectMake(0, [self view].bounds.size.height * heightOfSiri, [self view].bounds.size.width, [self view].bounds.size.height * (1 - heightOfSiri))];
    }
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
        
            [[self view] insertSubview:changeViewBtn atIndex:5];
        }
    }
}

//nasty crash going on here, someone send help (literally, crashes when you press the help button twice)
BOOL hasHelp;

-(void)siriViewDidReceiveHelpAction:(id)arg1{
    if(!pirated && enabled && helpInvokesFullScreen){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];

        [[self view] setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        isFullScreenView = YES;
        [changeViewBtn setTintColor:[UIColor whiteColor]];
        [changeViewBtn setFrame:CGRectMake([self view].bounds.size.width * .85, ([self view].bounds.size.height -33), 22, 22)];
        [changeViewBtn setBackgroundImage:minusButtonImg forState:UIControlStateNormal];
        [changeViewBtn addTarget:self action:@selector(changeViews) forControlEvents:UIControlEventTouchDown];
        [UIView commitAnimations];
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
    [plusButtonImg release];
    [minusButtonImg release];

    hasHelp = YES;
    if(!hasHelp){
        %orig;
    }
}
//new method to toggle between fullscreen and half/quarter/whatever size
%new
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

//yes, this is "drm" - kill me now
inline void memes(){
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
    memes();
}