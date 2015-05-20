/* Generated by RuntimeBrowser
   Image: /System/Library/PrivateFrameworks/AssistantUI.framework/AssistantUI
 */

@class AFBulletin, NSDictionary, NSNumber, NSString, NSURL, SASPronunciationContext;

@interface AFUIRequestOptions : NSObject <NSCopying, NSSecureCoding> {
    BOOL _acousticIdEnabled;
    NSString *_appBundleIdentifier;
    NSString *_bluetoothDeviceAddress;
    AFBulletin *_bulletin;
    NSDictionary *_continuityInfo;
    int _directActionEvent;
    double _expectedTimestamp;
    NSNumber *_homeButtonUpFromBeep;
    BOOL _initialBringUp;
    NSDictionary *_messagesDirectActionContext;
    SASPronunciationContext *_pronunciationContext;
    BOOL _pronunciationRequest;
    int _requestSource;
    NSString *_serverCommandId;
    NSURL *_speechFileURL;
    NSString *_text;
    double _timestamp;
    BOOL _useAutomaticEndpointing;
    BOOL _useStreamingDictation;
}

@property BOOL acousticIdEnabled;
@property(copy) NSString * appBundleIdentifier;
@property(copy) NSString * bluetoothDeviceAddress;
@property(retain) AFBulletin * bulletin;
@property(copy) NSDictionary * continuityInfo;
@property int directActionEvent;
@property double expectedTimestamp;
@property(getter=isForSpeechRequest,readonly) BOOL forSpeechRequest;
@property(getter=isForStark,readonly) BOOL forStark;
@property(retain) NSNumber * homeButtonUpFromBeep;
@property(getter=isInitialBringUp) BOOL initialBringUp;
@property(copy) NSDictionary * messagesDirectActionContext;
@property(retain) SASPronunciationContext * pronunciationContext;
@property(getter=isPronunciationRequest) BOOL pronunciationRequest;
@property int requestSource;
@property(copy) NSString * serverCommandId;
@property(copy) NSURL * speechFileURL;
@property(copy) NSString * text;
@property double timestamp;
@property BOOL useAutomaticEndpointing;
@property BOOL useStreamingDictation;

+ (BOOL)supportsSecureCoding;

- (void).cxx_destruct;
- (void)_configureStreamingDictationForSource:(int)arg1;
- (BOOL)acousticIdEnabled;
- (id)appBundleIdentifier;
- (id)bluetoothDeviceAddress;
- (id)bulletin;
- (id)continuityInfo;
- (id)copyWithZone:(struct _NSZone { }*)arg1;
- (id)description;
- (int)directActionEvent;
- (void)encodeWithCoder:(id)arg1;
- (double)expectedTimestamp;
- (id)homeButtonUpFromBeep;
- (id)init;
- (id)initWithCoder:(id)arg1;
- (id)initWithRequestSource:(int)arg1;
- (BOOL)isForSpeechRequest;
- (BOOL)isForStark;
- (BOOL)isInitialBringUp;
- (BOOL)isPronunciationRequest;
- (id)messagesDirectActionContext;
- (id)pronunciationContext;
- (int)requestSource;
- (id)serverCommandId;
- (void)setAcousticIdEnabled:(BOOL)arg1;
- (void)setAppBundleIdentifier:(id)arg1;
- (void)setBluetoothDeviceAddress:(id)arg1;
- (void)setBulletin:(id)arg1;
- (void)setContinuityInfo:(id)arg1;
- (void)setDirectActionEvent:(int)arg1;
- (void)setExpectedTimestamp:(double)arg1;
- (void)setHomeButtonUpFromBeep:(id)arg1;
- (void)setInitialBringUp:(BOOL)arg1;
- (void)setMessagesDirectActionContext:(id)arg1;
- (void)setPronunciationContext:(id)arg1;
- (void)setPronunciationRequest:(BOOL)arg1;
- (void)setRequestSource:(int)arg1;
- (void)setServerCommandId:(id)arg1;
- (void)setSpeechFileURL:(id)arg1;
- (void)setText:(id)arg1;
- (void)setTimestamp:(double)arg1;
- (void)setUseAutomaticEndpointing:(BOOL)arg1;
- (void)setUseStreamingDictation:(BOOL)arg1;
- (id)speechFileURL;
- (id)text;
- (double)timestamp;
- (BOOL)useAutomaticEndpointing;
- (BOOL)useStreamingDictation;

@end
