@class SBApplication;

@interface SBApplicationController : NSObject

+ (SBApplicationController *)sharedInstance;
- (SBApplication *)applicationWithDisplayIdentifier:(NSString *)bundleIdentifier;

// from SBLockScreenNotificationModel?
- (id)listItemAtIndexPath:(id)indexPath;

@end
