@class SBApplicationIcon;

@interface SBIconModel : NSObject

- (SBApplicationIcon *)applicationIconForDisplayIdentifier:(NSString *)displayIdentifier;

// ios 8
- (id)applicationIconForBundleIdentifier:(id)bundleIdentifier;

@end