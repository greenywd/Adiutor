/* Generated by RuntimeBrowser
   Image: /System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI
 */

@class NSBundle, NSString, NSURL, SAUIAppPunchOut;

@interface AFUIImageResource : NSObject {
    NSString *_localPressedResourceName;
    SAUIAppPunchOut *_localPunchOut;
    NSBundle *_localResourceBundle;
    NSString *_localResourceName;
    struct CGSize { 
        float width; 
        float height; 
    } _logoSize;
    float _remotePressedScale;
    NSURL *_remotePressedURL;
    SAUIAppPunchOut *_remotePunchOut;
    float _remoteScale;
    NSURL *_remoteURL;
}

@property(copy) NSString * localPressedResourceName;
@property(retain) SAUIAppPunchOut * localPunchOut;
@property(retain) NSBundle * localResourceBundle;
@property(copy) NSString * localResourceName;
@property struct CGSize { float x1; float x2; } logoSize;
@property float remotePressedScale;
@property(copy) NSURL * remotePressedURL;
@property(retain) SAUIAppPunchOut * remotePunchOut;
@property float remoteScale;
@property(copy) NSURL * remoteURL;

+ (id)imageResourceFromKey:(id)arg1 pressedKey:(id)arg2 punchOut:(id)arg3;
+ (id)imageResourceWithAppPunchOut:(id)arg1;
+ (id)imageResourceWithLocalResourceName:(id)arg1 pressedResourceName:(id)arg2 localPunchOut:(id)arg3 bundle:(id)arg4;

- (void).cxx_destruct;
- (void)_fetchLocalResourcesWithCompletion:(id)arg1;
- (void)_fetchRemoteResourcesWithCompletion:(id)arg1;
- (id)_imageInLocalResourceBundleNamed:(id)arg1;
- (void)getLogoWithCompletion:(id)arg1;
- (id)localPressedResourceName;
- (id)localPunchOut;
- (id)localResourceBundle;
- (id)localResourceName;
- (struct CGSize { float x1; float x2; })logoSize;
- (float)remotePressedScale;
- (id)remotePressedURL;
- (id)remotePunchOut;
- (float)remoteScale;
- (id)remoteURL;
- (void)setLocalPressedResourceName:(id)arg1;
- (void)setLocalPunchOut:(id)arg1;
- (void)setLocalResourceBundle:(id)arg1;
- (void)setLocalResourceName:(id)arg1;
- (void)setLogoSize:(struct CGSize { float x1; float x2; })arg1;
- (void)setRemotePressedScale:(float)arg1;
- (void)setRemotePressedURL:(id)arg1;
- (void)setRemotePunchOut:(id)arg1;
- (void)setRemoteScale:(float)arg1;
- (void)setRemoteURL:(id)arg1;

@end
