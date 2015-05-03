@interface SBApplication : UIApplication

@property (nonatomic, retain) NSString *bundleIdentifier;
@property (nonatomic, retain) NSString *sandboxPath;
@property (nonatomic, retain) NSString *path;
@property(copy) NSString *displayIdentifier;

@end
